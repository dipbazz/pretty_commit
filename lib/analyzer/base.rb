require 'colorize'

module PreetyCommit
  @@errors = []

  # class Error
  #   def initialize(type, message)
  #     @type = type
  #     @message = message
  #   end
  # end

  def add_error(type, message, location=nil)
    @@errors << [type, message, location]
  end

  def generate_report
    error_color = [:blue, :red, :white]

    @@errors.each do |error|
      message = "#{error[0]}:".colorize(:blue) + (error[1]).to_s.colorize(:red)
      message += "\n#{error[2]}".colorize(:cyan).underline if error[2]
      yield message
    end

    if @@errors.empty?
      puts "\nHmm. You have mastered the git commit message.".colorize(:green)
    else
      puts "\nTotal " + "#{@@errors.length} errors".colorize(:red) + "detected."
    end
  end
end
