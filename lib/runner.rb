require 'colorize'
require_relative './git'
require_relative './analyzer/title_length'
require_relative './analyzer/title_type'
require_relative './analyzer/title_ends_with_dot'
require_relative './analyzer/description'
require_relative './analyzer/base'

def access_commit_file(_dir_path)
  File.join(Dir.pwd, '/COMMIT_EDITMSG')
end

def create_last_commit_file
  system('git log -n 1 > COMMIT_EDITMSG')
end

def delete_commit_file(dir_path); end

def start_preety_commit(dir_path, &block)
  Dir.chdir(dir_path) do
    if Dir.exist?('.git')
      create_last_commit_file

      git_commit = Git.new(access_commit_file(dir_path))

      TitleLength.new(git_commit.title.full_title).check_error

      TitleTypeValid.new(git_commit.title.type).check_error

      TitleTypeCapitalize.new(git_commit.title.type).check_error

      DescriptionAnalyzer.new(git_commit.description.description).check_error

      PrettyCommit::Error.all.each do |instance|
        instance.generate_error(&block)
      end

      PrettyCommit::Error.total_error(&block)

      delete_commit_file(dir_path)
    else
      yield 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end
