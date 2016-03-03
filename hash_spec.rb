require_relative 'hash'

describe Hash do

  let(:hash) { Hashish.new }

  describe '#new' do
    it 'creates a hash' do
      expect(hash).to be_instance_of Hashish
    end
  end

  describe '#set(key, value)' do
      it 'adds a key-value pair to the hash' do
        hash.set('a', 'b')
        expect(hash.get('a')).to eq('b')
      end

      it 'replaces the value if the key is already present' do
        hash.set('a', 'b')
        hash.set('a', 'c')
        expect(hash.get('a')).to eq('c')
      end

      it 'returns the value' do
        expect(hash.set('a', 'b')).to eq('b')
      end
    end

    describe '#get(key)' do
      it 'retrieves the value stored at key' do
        hash.set('a', 'b')
        hash.set('y', 'z')
        expect(hash.get('y')).to eq('z')
      end
    end

    describe '#has_key?(key)' do
      it 'returns true if key exists' do
        hash.set('a', 'b')
        expect(hash.has_key?('a')).to be true
      end
      it 'returns false if key does not exist' do
        hash.set('a', 'b')
        expect(hash.has_key?('z')).to be false
      end
    end

    describe '#remove(key)' do
      it 'removes key' do
        hash.set('a', 'b')
        hash.set('y', 'z')
        hash.remove('y')
        expect(hash.get('y')).to be_nil
      end
    end

end
