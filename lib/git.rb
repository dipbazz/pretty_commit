
class Git
  attr_reader :title, :description

  def initialize(file_path)
    message = read_file(file_path)

    @title = Title.new(extract_title(message))
    @description = Description.new(extract_description(message))
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

  def extract_title(message)
    message.match(/(.+\n?)+\n{2,}/x) do |title|
      title = title.to_s.strip
    end
  end

  def extract_description(message)
    message.match(/\n{2,}(.+\n+)+/x) do |description|
      description = description.to_s.strip
    end
  end
end

class Title
  def initialize(title)
    @type = ''
    @short_summary = ''
    @scope = ''

    update_values(title)
  end

  def full_title
    "#{@type} #{@scope} #{@short_summary}"
  end

  private

  def update_values(title)
    title_splitted = title.split
    @type = title_splitted[0]
    @scope = title_splitted[1] if title_splitted[1]
    @short_summary = title_splitted[2..-1].join(' ') if title_splitted[2]
  end
end

class Description
  attr_reader :description

  def initialize(description)
    @description = description
  end
end
