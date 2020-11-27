require_relative '../../lib/analyzer/title_length'
require_relative '../../lib/analyzer/base'

describe TitleLength do
  let(:valid_title) { TitleLength.new('A title with short message') }
  let(:invalid_title) do
    TitleLength.new('This title exceeds the line limit of 50 characters or more to test')
  end

  describe '#check_error' do
    context 'when valid title' do
      it 'returns empty' do
        expect(valid_title.check_error).to be_nil
      end
    end

    context 'when invalid title' do
      it 'adds error' do
        expect(invalid_title.check_error).to eql(1)
      end
    end
  end
end
