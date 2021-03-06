require_relative './base'

class TitleType < Analyzer
  def initialize(type)
    super()

    @title_type = type
  end
end

class TitleTypeValid < TitleType
  def initialize(type)
    super

    @error_type = 'TitleTypeNotExplainatory'
    @location = "\nTitle type: #{@title_type}"
    @message = proc { "Title type should be from a list #{TITLE_TYPE}" }
  end

  def check_error
    return if type_included?

    @error.add_error(@error_type, @message.call, @location)
  end

  private

  def type_included?
    TITLE_TYPE.include?(@title_type.downcase)
  end
end

class TitleTypeCapitalize < TitleType
  def initialize(type)
    super

    @error_type = 'TitleTypeNotCapitalize'
    @location = "\nTitle type: #{@title_type}"
    @message = "Title type should be capitalize. Make #{@title_type.capitalize} not #{@title_type}"
  end

  def check_error
    return if type_capitalized?

    @error.add_error(@error_type, @message, @location)
  end

  private

  def type_capitalized?
    return @title_type[0] == @title_type[0].upcase if @title_type[0]

    false
  end
end
