#!/usr/bin/env ruby
require 'colorize'
require './lib/git'

Dir.chdir(__dir__) do
  Dir.chdir('../') do
    if Dir.exist?('.git')
      x = Git.new("#{Dir.pwd}/CnOMMIT_EDITMSG")

      puts x.title, x.description
      puts x.full_title
    else
      puts 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end
