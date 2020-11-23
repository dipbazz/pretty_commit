require 'pry'

class Git
  attr_reader :title, :description

  def initialize(file_path)
    @title = {
      type: '',
      scope: '',
      short_summary: ''
    }
    @description = ''

    message = read_file(file_path)
    update_title(message)
    update_description(message)
  end

  def full_title
    "#{title[:type]} #{title[:scope]} #{title[:short_summary]}"
  end

  private

  def read_file(file_path)
    File.open(file_path) do |file|
      message = ''

      file.each do |line|
        next unless file.lineno > 4

        message += line
      end
      message
    end
  rescue Errno::ENOENT
    false
  end

  def update_title(message)
    message.match(/(.+\n?)+\n{2,}/x) do |title|
      title = title.to_s.strip
      return false unless title.length > 1

      title_splitted = title.split
      self.title[:type] = title_splitted[0]
      self.title[:scope] = title_splitted[1] if title_splitted[1]
      self.title[:short_summary] = title_splitted[2..-1].join(' ') if title_splitted[2]
    end
  end

  def update_description(message)
    message.match(/\n{2,}(.+\n+)+/x) do |description|
      description = description.to_s.strip
      @description = description
    end
  end
end
