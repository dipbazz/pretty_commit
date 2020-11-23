#!/usr/bin/env ruby
require 'colorize'
require './lib/git'

def access_commit_file
  File.join(__dir__, '../COMMIT_EDITMSG')
end

Dir.chdir(__dir__) do
  Dir.chdir('../') do
    # system("git log -n 1")
    if Dir.exist?('.git')
      x = Git.new(access_commit_file)

      puts x.title, x.description
      puts x.full_title
    else
      puts 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end

# r = system("git log -n 1")
