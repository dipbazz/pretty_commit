require './lib/git'

describe Git do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  describe '#initialize' do
    context 'when initialized' do
      it 'checks title is class' do
        expect(git.title).to be_kind_of(Title)
      end

      it 'checks description is class' do
        expect(git.description).to be_kind_of(Description)
      end
    end
  end
end

describe Title do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  context 'when title is initialized' do
    it 'checks type' do
      expect(git.title.type).to eql('Initialize')
    end

    it 'checks scope' do
      expect(git.title.scope).to eql('test')
    end

    it 'checks short summary' do
      expect(git.title.short_summary).to start_with('in the project and add git_spec.rb')
    end
  end

  describe '#full_title' do
    it 'checks full title title' do
      expect(git.title.full_title).to start_with('Initialize test in the project and add git_spec.rb')
    end
  end
end

describe Description do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  context 'when description is initialized' do
    it 'checks for description' do
      expect(git.description.description).to start_with('Add test case in git_spec.rb file which test:')
    end
  end
end
