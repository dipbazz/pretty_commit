class FileHandler
  def initialize(file_path)
    @file = file_path
  end

  def read_file
    File.open(@file) do |file|
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
end
