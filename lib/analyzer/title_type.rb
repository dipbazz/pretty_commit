require './lib/analyzer/base'

TITLE_TYPE = %w[build ci docs feat add update refactor fix style test revert perf].freeze

class TitleType < Analyzer
  def initialize(type)
    super()

    @title_type = type
    @error_type = 'TitleType'
    @location = "\nTitle type: #{@title_type}"
    @message = proc { "Use title type from a list of #{TITLE_TYPE}" }
  end

  attr_reader :error

  def type_included?
    TITLE_TYPE.include?(@title_type.downcase)
  end

  def check_error
    return if type_included?

    @error.add_error(@error_type, @message.call, @location)
  end
end
