require './lib/auction'

describe Auction do 

  let(:auction) {Auction.new}

  describe 'initialization' do
    it 'exists' do
      expect(auction.items).to be_an(Item)
    end
  end

  describe '#items' do
    it 'starts with no items' do
      expect(auction.items).to eq([])
    end

    it 'can add items' do
      item1 = Item.new('Chalkware Piggy Bank')
      auction.add_item(item1)
      item2 = Item.new('Bamboo Picture Frame')
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end
  end

  describe '#item_names' do

    it 'can return list of items' do
      item1 = Item.new('Chalkware Piggy Bank')
      auction.add_item(item1)
      item2 = Item.new('Bamboo Picture Frame')
      auction.add_item(item2)
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
end