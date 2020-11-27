require './lib/git'

describe Git do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  describe '#initialize' do
    context 'when initialized' do
      it 'checks title is class' do
        expect(git.title).to be_kind_of(Title)
      end

      it 'checks title of not kind' do
        expect(git.title).not_to be_kind_of(Integer)
      end

      it 'checks description is class' do
        expect(git.description).to be_kind_of(Description)
      end

      it 'checks description of not kind' do
        expect(git.description).not_to be_kind_of(String)
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

    it 'checks for only one word type' do
      expect(git.title.type.split.length).to eql(1)
    end

    it 'checks scope' do
      expect(git.title.scope).to eql('test')
    end

    it 'checks for only one word scope' do
      expect(git.title.scope.split.length).to eql(1)
    end

    it 'checks short summary' do
      expect(git.title.short_summary).to start_with('in the project and add git_spec.rb')
    end

    it 'checks for not only one word type' do
      expect(git.title.type.split.length).not_to be > 1
    end

    it 'checks type for not equal' do
      expect(git.title.type).not_to eql('Not equal')
    end

    it 'checks scope for negation' do
      expect(git.title.scope).not_to eql('Not equal')
    end

    it 'checks for not only one word scope' do
      expect(git.title.scope.split.length).not_to be > 1
    end

    it 'checks short summary for negation' do
      expect(git.title.short_summary).not_to start_with('shouldnot start with this')
    end
  end

  describe '#full_title' do
    it 'checks full title title' do
      expect(git.title.full_title).to start_with('Initialize test in the project and add git_spec.rb')
    end

    it 'checks full title title' do
      expect(git.title.full_title).not_to start_with('shouldnot start with this')
    end
  end
end

describe Description do
  let(:git) { Git.new(File.join(__dir__, 'git_commit_test.txt')) }

  context 'when description is initialized' do
    it 'checks for description' do
      expect(git.description.description).to start_with('Add test case in git_spec.rb file which test:')
    end

    it 'checks for description' do
      expect(git.description.description).not_to start_with('shouldnot start with this')
    end
  end
end
