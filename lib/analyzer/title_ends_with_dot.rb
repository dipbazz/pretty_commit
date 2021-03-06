require_relative './base'

class TitleEndsWithDot < Analyzer
  def initialize(title)
    super()

    @title = title
    @error_type = 'TitleEndsWithDot'
    @message = "Title shouln't end with dot(.)"
    @location = "... #{@title[-@title.length / 2..-1]}"
  end

  def check_error
    return unless title_has_a_dot?

    @error.add_error(@error_type, @message, @location)
  end

  private

  def title_length
    @title.full_title.length
  end

  def title_has_a_dot?
    @title.end_with?('.')
  end
end
