#!/usr/bin/env ruby
require 'colorize'
require './lib/git.rb'


Dir.chdir(__dir__) do
  Dir.chdir('../') do
    if Dir.exist?('.git')
      x = Git.new("#{Dir.pwd}/TEST_COMMIT.txt")
    else
      puts 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end
