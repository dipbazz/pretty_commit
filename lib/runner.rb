require 'colorize'
require_relative './git'
require_relative './analyzer/title_length'
require_relative './analyzer/title_type'
require_relative './analyzer/title_ends_with_dot'
require_relative './analyzer/description'
require_relative './analyzer/base'

class Runner
  def initialize(dir_path, commit: false)
    @dir_path = dir_path
    @commit = commit

    @git = nil
    @analyzer = []
  end

  def start(&block)
    Dir.chdir(@dir_path) do
      if Dir.exist?('.git')
        create_commit(default_commit_msg_file) if @commit

        unless @commit
          create_last_commit_file

          @git = Git.new(commit_file)
          @analyzer = [
            TitleLength.new(@git.title.full_title),
            TitleTypeValid.new(@git.title.type),
            TitleEndsWithDot.new(@git.title.full_title),
            DescriptionAnalyzer.new(@git.description.description)
          ]

          check_for_error
          report(&block)
        end
      else
        yield 'You have not created a git repository. First create a repo and add commit.'.colorize(:red).underline
      end
    end
  end

  def commit_file
    File.join(__dir__, '../COMMIT_EDITMSG')
  end

  def default_commit_msg_file
    File.join(__dir__, '../GIT_COMMIT_MSG')
  end

  def create_last_commit_file
    system("git log -n 1 > #{commit_file}")
  end

  def create_commit(file_path)
    system("git commit -t #{file_path}")
  end

  def check_for_error
    @analyzer.each(&:check_error)
  end

  def report(&block)
    total_error = 0
    ObjectSpace.each_object(PrettyCommit::Error).each do |instance|
      instance.generate_error(&block)
      total_error += instance.total_error
    end

    total_error(total_error, &block)
  end

  def total_error(total_error)
    if total_error.zero?
      yield "\nHmm. You have mastered the git commit message.".colorize(:green)
    else
      yield "\nTotal #{"#{total_error} errors".colorize(:red)} detected."
    end
  end
end
