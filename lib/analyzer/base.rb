require 'colorize'

module PrettyCommit
  MAX_TITLE_LENGTH = 50
  MIN_TITLE_LENGTH = 5

  TITLE_TYPE = %w[build ci docs feat add update refactor fix style test revert perf].freeze

  MAX_DESCRIPTION_LENGTH = 72

  class Error
    def initialize
      @errors = []
      @error_count = 0
    end

    def add_error(type, message, location = '')
      @errors << [type, message, location]
      @error_count += 1
    end

    def generate_error
      @errors.each do |error|
        message = (error[2]).to_s.colorize(:default).bold if error[2]
        message += "\n#{'^' * error[2].length}"
        message += "\n#{error[0]}: ".colorize(:light_blue) + (error[1]).to_s.colorize(:red)
        yield message
      end
    end

    def total_error
      @error_count
    end
  end
end

class Analyzer
  include PrettyCommit

  def initialize
    @error_type = ''
    @message = ''
    @location = ''

    @error = Error.new
  end

  attr_reader :error

  def check_error; end
end
