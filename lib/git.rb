class Git
  def initialize(file)
    @file = file
    @title = {
      type: '',
      scope: '',
      short_summary: ''
    }
    @description = ''

    read_file do |line|
      puts line
    end
  end

  private

  def read_file
    File.open(@file) do |file|
      file.each do |line|
        if line.include?("\n")
          puts "here it is: " + line
        end
        yield line unless line.lstrip.match(/^#/)
      end
    end
  end
end
