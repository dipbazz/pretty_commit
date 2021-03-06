require_relative './base'

class TitleLength < Analyzer
  def initialize(title)
    super()

    @title = title
    @error_type = 'TitleLength'
    @message = proc { |len|
      "Title length should be in between #{MIN_TITLE_LENGTH} - #{MAX_TITLE_LENGTH}. Your title length is #{len}."
    }
    @location = @title
  end

  def check_error
    return if title_length_valid?

    @error.add_error(@error_type, @message.call(title_length), @location)
  end

  private

  def title_length
    @title.length
  end

  def title_length_valid?
    title_length >= MIN_TITLE_LENGTH && title_length <= MAX_TITLE_LENGTH
  end
end
