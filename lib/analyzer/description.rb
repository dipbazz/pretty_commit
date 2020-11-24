require './lib/analyzer/base'

MAX_LENGTH = 72

class DescriptionAnalyzer < Analyzer
  def initialize(description)
    super()

    @description = description
    @description_by_line = @description.split("\n")

    @error_type = 'DescriptionLineLength'
    @message = proc { |len|
      "This line in your description exceeds the line limit #{MAX_LENGTH}. It has a length of #{len}"
    }
    @location = proc { |line| line.to_s }
    p @description_by_line
  end

  def line_valid?(line)
    line.length <= MAX_LENGTH
  end

  def check_error
    return unless @description

    @description_by_line.each do |line|
      line[0..3] = ''
      @error.add_error(@error_type, @message.call(line.length), @location.call(line)) unless line_valid?(line)
    end
  end
end
