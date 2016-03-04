require_relative 'hash_set'

describe HashSet do

  let(:set) { HashSet.new }

  describe '#new' do
    it 'instantiates a new HashSet' do
      expect(set).to be_instance_of HashSet
    end
  end

  describe '#add(element)' do
    it 'adds an element to the set if needed' do
      set.add(4)
      expect(set.instance_variable_get(:@set).get('4')).not_to be_nil
    end
  end

  describe '#remove(element)' do
    it 'removes an element from the set if it is present' do
      set.add(4)
      set.remove(4)
      expect(set.instance_variable_get(:@set).get('4')).to be_nil
    end
  end

  describe '#contains?(element)' do
    it 'answers true if element is in the set' do
      set.add(4)
      expect(set.contains?(4)).to be true
    end

    it 'answers false if element is not in the set' do
      expect(set.contains?(4)).to be false
    end
  end

  describe 'iterate {|element| block}' do
    it 'iterates block over each element' do
      set.add(4)
      result = []
      set.iterate { |e| result.push(e) if e == 4 }
      expect(result).to eq([4])
    end
  end

  describe 'size' do
    it 'gives the size' do
      set.add(4)
      expect(set.size).to eq(1)
    end
  end
end
