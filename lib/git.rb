class Git
  attr_reader :title, :description

  def initialize(file_path)
    @title = {
      type: '',
      scope: '',
      short_summary: ''
    }
    @description = ''

    read_file(file_path)
  end

  def full_title
    "#{title[:type]} #{title[:scope]} #{title[:short_summary]}"
  end

  private

  def read_file(file_path)
    File.open(file_path) do |file|
      got_title = false
      file.each do |line|
        if line.length > 1 && line.include?("\n")
          if got_title
            @description += line unless line.lstrip.match(/^#/)
          else
            update_title(line)
            got_title = true
          end
        end
      end
    end
  rescue Errno::ENOENT
    'File donot exist.'
  end

  def update_title(line)
    title_splitted = line.split
    title[:type] = title_splitted[0]
    title[:scope] = title_splitted[1]
    title[:short_summary] = title_splitted[2..-1].join(' ')
  end
end
