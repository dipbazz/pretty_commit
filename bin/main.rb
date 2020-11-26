#!/usr/bin/env ruby

require 'colorize'
require_relative '../lib/runner'

TAB_SIZE = 4

if ARGV.include?('-h')
  puts 'Usage: bin/PrettyCommit [path]'.colorize(:green)
  puts "\npath:"
  puts "#{' ' * TAB_SIZE}1. /path/to/your/project/directory/"
  puts "#{' ' * TAB_SIZE}2. . (default)"
else
  dir_path = ARGV[0] || '.'
  start_preety_commit(dir_path) { |message| puts message }
end
