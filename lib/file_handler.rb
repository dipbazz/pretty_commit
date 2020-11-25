class FileHandler
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read_file
    File.open(file_path) do |file|
      message = ''

      file.each do |line|
        next unless file.lineno > 4

        message += line
      end
      message
    end
  rescue Errno::ENOENT
    nil
  end
end
