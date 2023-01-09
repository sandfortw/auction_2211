require './lib/auction'

describe Auction do 

  let(:auction) {Auction.new}

  describe 'initialization' do
    it 'exists' do
      expect(auction).to be_an(Auction)
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

  describe '#unpopular_items and #potential_revenue' do
    let(:item1) {Item.new('Chalkware Piggy Bank')}
    let(:item2) {Item.new('Bamboo Picture Frame')}
    let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
    let(:item4) {Item.new('2 Days Dogsitting')}
    let(:item5) {Item.new('Forever Stamps')}
    let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}
    let(:attendee3) {Attendee.new(name: 'Mike', budget: '$100')}
    let(:auction) {Auction.new}

    it 'returns unpopular items' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq([item2, item4])
    end

    it 'returns potential revenue' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      expect(auction.potential_revenue).to eq(87)
    end
  end
end