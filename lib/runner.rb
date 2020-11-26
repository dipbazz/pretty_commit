require 'colorize'
require_relative './git'
require_relative './analyzer/title_length'
require_relative './analyzer/title_type'
require_relative './analyzer/title_ends_with_dot'
require_relative './analyzer/description'
require_relative './analyzer/base'

def access_commit_file
  File.join(Dir.pwd, '/COMMIT_EDITMSG')
end

def create_last_commit_file
  system('git log -n 1 > COMMIT_EDITMSG')
end

def display_total_error(total_error)
  if total_error.zero?
    yield "\nHmm. You have mastered the git commit message.".colorize(:green)
  else
    yield "\nTotal #{"#{total_error} errors".colorize(:red)} detected."
  end
end

def start_preety_commit(dir_path, &block)
  Dir.chdir(dir_path) do
    if Dir.exist?('.git')
      create_last_commit_file

      git_commit = Git.new(access_commit_file)

      TitleLength.new(git_commit.title.full_title).check_error

      TitleTypeValid.new(git_commit.title.type).check_error

      TitleEndsWithDot.new(git_commit.title.full_title).check_error

      TitleTypeCapitalize.new(git_commit.title.type).check_error

      DescriptionAnalyzer.new(git_commit.description.description).check_error

      total_error = 0
      ObjectSpace.each_object(PrettyCommit::Error).each do |instance|
        instance.generate_error(&block)
        total_error += instance.total_error
      end

      display_total_error(total_error, &block)
    else
      yield 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end
