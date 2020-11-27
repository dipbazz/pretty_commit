require './lib/file_handler'

def access_test_file
  File.join(__dir__, 'git_commit_test.txt')
end

describe FileHandler do
  let(:file) { FileHandler.new(access_test_file) }
  let(:file_with_no_path) { FileHandler.new('this/path/dont/exist') }

  describe '#initialize' do
    it 'checks if the file path is correct' do
      expect(file.file_path).to eql(access_test_file)
    end

    it 'checks for incorrect path' do
      expect(file.file_path).not_to eql('incorrect/path/to/fail/')
    end

    it 'handles the incorrect file path' do
      expect { file.file_path = 'update/location/' }.to raise_error(NoMethodError)
    end
  end

  describe '#read_file' do
    it 'checks the content of file' do
      expect(file.read_file).to start_with('    Initialize test in the project and add git_spec.rb')
    end

    it 'checks content that dont exist' do
      expect(file.read_file).not_to start_with('this is not in the file')
    end

    it 'handles the file not found error' do
      expect(file_with_no_path.read_file).to eql(nil)
    end
  end
end
