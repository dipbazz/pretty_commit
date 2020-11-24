require './lib/analyzer/base'

MAX_LENGTH = 50
MIN_LENGTH = 5

class TitleLength
  include PreetyCommit

  def initialize(title)
    @title = title
    @type = 'TitleLength'
    @message = proc { |len|
      "Title length should be in between #{MIN_LENGTH} - #{MAX_LENGTH}. Your title length is #{len}."
    }
  end

  def title_length
    @title.full_title.length
  end

  def title_length_valid?
    title_length >= MIN_LENGTH && title_length <= MAX_LENGTH
  end

  def check_error
    return if title_length_valid?

    add_error(@type, @message.call(title_length), @title.full_title)
  end
end
