require_relative '../../lib/analyzer/title_ends_with_dot'
require_relative '../../lib/analyzer/base'

describe TitleEndsWithDot do
  let(:title_without_dot) { TitleEndsWithDot.new('A title without dot') }
  let(:title_with_dot) { TitleEndsWithDot.new('This is a title with dot.') }

  describe '#check_error' do
    context "when don't have dot" do
      it 'returns empty' do
        expect(title_without_dot.check_error).to be_nil
      end
    end

    context 'when title have a dot' do
      it 'adds error' do
        expect(title_with_dot.check_error).to eql(1)
      end
    end
  end
end
