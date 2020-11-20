#!/usr/bin/env ruby
require 'colorize'

puts 'hello world'

Dir.chdir(__dir__) do
  Dir.chdir('../') do
    if Dir.exist?('.git')
      File.open("#{Dir.pwd}/README.md") do |file|
        file.each do |line|
          puts line unless line.lstrip.match(/^#/)
        end
      end

    else
      puts 'You have not created a git repository. First create a repo and add commits.'.colorize(:red).underline
    end
  end
end


