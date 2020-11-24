#!/usr/bin/env ruby
require 'colorize'
require './lib/git'
require './lib/analyzer/title_length'
require './lib/analyzer/title_type'
require './lib/analyzer/title_ends_with_dot'
require './lib/analyzer/base'

def access_commit_file
  File.join(__dir__, '../COMMIT_EDITMSG')
end

Dir.chdir(__dir__) do
  Dir.chdir('../') do
    # system("git log -n 1")
    if Dir.exist?('.git')
      x = Git.new(access_commit_file)

      check_title = TitleLength.new(x.title.full_title)
      check_title.check_error

      check_type = TitleTypeValid.new(x.title.type)
      check_type.check_error

      type_cap = TitleTypeCapitalize.new(x.title.type)
      type_cap.check_error

      PreetyCommit::Error.all.each do |instance|
        instance.generate_error { |message| puts message }
      end

      PreetyCommit::Error.total_error { |message| puts message }
      # puts x.title.full_title, x.description.description
      # puts x.full_title
    else
      puts 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end

# r = system("git log -n 1")
