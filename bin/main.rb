#!/usr/bin/env ruby

require 'colorize'
require_relative '../lib/runner'

TAB_SIZE = 4

if ARGV.include?('-h')
  puts 'Usage: bin/main.rb [-p <dir_path>] [-c] [-h]'
  puts "\nExplanation of arguments:"
  puts "#{' ' * TAB_SIZE}-p #{' ' * TAB_SIZE} is to specify a path for a directory."
  puts "#{' ' * TAB_SIZE}-c #{' ' * TAB_SIZE} is to specify if you want this program to run git commit for you."
  puts "#{' ' * TAB_SIZE}-h #{' ' * TAB_SIZE} gives you this help mesage."
  puts "\n<dir_path>:"
  puts "#{' ' * TAB_SIZE}1. /path/to/your/project/directory/"
  puts "#{' ' * TAB_SIZE}2. . (default)"
else
  dir_path = '.'
  if ARGV.include?('-p')
    index = ARGV.find_index('-p')
    dir_path = ARGV[index + 1] if ARGV[index + 1]
  end
  run = Runner.new(dir_path, commit: ARGV.include?('-c'))
  run.start { |message| puts message }
  # start_preety_commit(dir_path, ARGV.include?('-c')) { |message| puts message }
end
