require_relative '../../lib/analyzer/title_type'
require_relative '../../lib/analyzer/base'

describe TitleTypeValid do
  let(:valid_title_type) { TitleTypeValid.new('Add') }
  let(:invalid_title_type) { TitleTypeValid.new('invalidtype') }

  describe '#check_error' do
    context 'when valid title type' do
      it 'returns empty' do
        expect(valid_title_type.check_error).to be_nil
      end
    end

    context 'when invalid title type' do
      it 'adds error' do
        PrettyCommit::Error.clear
        invalid_title_type.check_error
        expect(PrettyCommit::Error.all.length).to eql(1)
      end
    end
  end
end

describe TitleTypeCapitalize do
  let(:valid_title_type) { TitleTypeCapitalize.new('Add') }
  let(:invalid_title_type) { TitleTypeCapitalize.new('invalidtype') }

  describe '#check_error' do
    context 'when valid title type' do
      it 'returns empty' do
        expect(valid_title_type.check_error).to be_nil
      end
    end

    context 'when invalid title type' do
      it 'adds error' do
        PrettyCommit::Error.clear
        invalid_title_type.check_error
        expect(PrettyCommit::Error.all.length).to eql(1)
      end
    end
  end
end
