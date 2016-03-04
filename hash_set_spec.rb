require_relative 'hash_set'

describe HashSet do

  let(:set) { HashSet.new }
  describe '#new' do
    it 'instantiates a new HashSet' do
      expect(set).to be_instance_of HashSet
    end
  end
end
