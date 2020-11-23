require './lib/git'

describe Git do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  describe '#initialize' do
    context 'when title is initialized' do
      it 'checks type' do
        expect(git.title[:type]).to eql('Initialize')
      end

      it 'checks scope' do
        expect(git.title[:scope]).to eql('test')
      end

      it 'checks short summary' do
        expect(git.title[:short_summary]).to eql('in the project and add git_spec.rb file
          making a long commit message to test')
      end
    end

    it 'checks a description' do
      expect(git.description).to start_with('Add test case in git_spec.rb')
    end
  end

  describe '#full_title' do
    it 'checks the title' do
      expect(git.full_title).to eql('Initialize test in the project and
        add git_spec.rb file making a long commit message to test')
    end
  end
end
