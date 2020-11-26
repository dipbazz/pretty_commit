require_relative '../../lib/analyzer/base'

describe PrettyCommit::Error do
  let(:error) { PrettyCommit::Error.new }
  let(:first_error) do
    error.add_error('ErrorTypeFirst', 'Error messageFirst', 'locationFirst')
  end
  let(:second_error) do
    error.add_error('ErrorTypeSecond', 'Error messageSecond', 'locationSecond')
  end

  describe '#add_error' do
    it 'adds error and increment the error count' do
      expect(first_error).to eql(1)
    end

    it 'adds error and increment the error count' do
      expect(second_error).to eql(1)
    end
  end

  describe '#generate_error' do
    context 'when no errors added' do
      it 'checks for empty' do
        expect(error.generate_error).to be_empty
      end

      it 'donot raise LocalJumpError' do
        expect { error.generate_error }.not_to raise_error
      end
    end

    context 'when one error added' do
      before { first_error }

      it 'raises LocalJumpError' do
        expect { error.generate_error }.to raise_error(LocalJumpError)
      end

      it 'not to control two yield' do
        expect { |b| error.generate_error(&b) }.not_to yield_control.twice
      end
    end

    context 'when two errors added' do
      before do
        first_error
        second_error
      end

      it 'controls two yield' do
        expect { |b| error.generate_error(&b) }.to yield_control.twice
      end
    end
  end
end

describe Analyzer do
  let(:analyzer) { Analyzer.new }

  describe '#check_error' do
    it 'return nil' do
      expect(analyzer.check_error).to be_nil
    end
  end
end
