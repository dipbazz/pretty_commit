require 'colorize'

# rubocop:disable Style/ClassVars
module PreetyCommit
  class Error
    @@instances = []
    @@error_count = 0

    def initialize
      @errors = []

      @@instances << self
    end

    def add_error(type, message, location = '')
      @errors << [type, message, location]
      @@error_count += 1
    end

    def generate_error
      @errors.each do |error|
        message = (error[2]).to_s.colorize(:default).bold if error[2]
        message += "\n#{'^' * error[2].length}"
        message += "\n#{error[0]}: ".colorize(:light_blue) + (error[1]).to_s.colorize(:red)
        yield message
      end
    end

    def self.clear
      @@instances.clear
    end

    def self.all
      @@instances
    end

    def self.total_error
      if @@error_count.zero?
        yield "\nHmm. You have mastered the git commit message.".colorize(:green)
      else
        yield "\nTotal #{"#{@@error_count} errors".colorize(:red)}detected."
      end
    end
  end
end
# rubocop:enable Style/ClassVars

class Analyzer
  include PreetyCommit

  def initialize
    @error_type = ''
    @message = ''
    @location = ''

    @error = Error.new
  end

  attr_reader :error

  def check_error; end
end
