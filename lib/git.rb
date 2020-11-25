require './lib/file_handler'

class Git
  attr_reader :title, :description

  def initialize(file_path)
    @file = FileHandler.new(file_path)

    message = @file.read_file
    @title = Title.new(extract_title(message))
    @description = Description.new(extract_description(message))
  end

  private

  def extract_title(message)
    message.match(/(.+\n?)(\n\s*\n)/x) do |title|
      title.to_s.strip
    end
  end

  def extract_description(message)
    message.match(/(\n\s*\n)(.+\n?)+/x) do |description|
      description.to_s.strip
    end
  end
end

class Title
  attr_reader :type, :scope, :short_summary

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
    return false unless title

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
