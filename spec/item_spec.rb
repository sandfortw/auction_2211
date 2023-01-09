require './lib/item'

describe Item do
  let(:item1) {Item.new('Chalkware Piggy Bank')}
  describe 'initialization' do
    it 'exists' do
    expect(item1).to be_instance_of(Item)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(item1.name).to eq("Chalkware Piggy Bank")
    end
  end

end