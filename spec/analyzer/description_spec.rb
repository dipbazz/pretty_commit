require_relative '../../lib/analyzer/description'
require_relative '../../lib/analyzer/base'

describe DescriptionAnalyzer do
  let(:empty_desc) { DescriptionAnalyzer.new('') }
  let(:desc) { DescriptionAnalyzer.new('This is a description') }

  describe '#check_error' do
    context 'when description is empty' do
      it 'returns empty' do
        expect(empty_desc.check_error).to be_empty
      end
    end

    context 'when description is valid' do
      it 'adds no error' do
        expect(desc.check_error).to eql(['This is a description'])
      end

      it 'validate empty error' do
        PrettyCommit::Error.clear
        desc.check_error
        expect(PrettyCommit::Error.all.length).to eql(1)
      end
    end
  end
end
