require './lib/git'

describe Git do
  let(:git) { Git.new("#{Dir.pwd}/spec/git_commit_test.txt") }

  describe '#initialize' do
    context 'when title is initialized' do
      it 'checks type' do
        expect(git.title[:type]).to eql('This')
      end

      it 'checks scope' do
        expect(git.title[:scope]).to eql('is')
      end

      it 'checks short summary' do
        expect(git.title[:short_summary]).to eql('a commit message to test for rspec')
      end
    end

    it 'checks a description' do
      expect(git.description).to start_with('and here comes the description')
    end
  end

  describe '#full_title' do
    it 'checks the title' do
      expect(git.full_title).to eql('This is a commit message to test for rspec')
    end
  end
end
