require './lib/auction'
require './lib/item'
require './lib/attendee'

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
    let(:attendee1) {Attendee.new(name: 'Megan', budget: '$50')}
    let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}
    let(:attendee3) {Attendee.new(name: 'Mike', budget: '$100')}
    let(:auction) {Auction.new}

    before(:each) do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
    end

    it 'returns unpopular items' do
      expect(auction.unpopular_items).to eq([item2, item3, item5])
      item3.add_bid(attendee2, 15)
      expect(auction.unpopular_items).to eq([item2, item5])
    end

    it 'returns potential revenue' do
      item3.add_bid(attendee2, 15)
      expect(auction.potential_revenue).to eq(87)
    end

    it 'has bidders' do
      expect(auction.bidders).to eq([attendee2, attendee1, attendee3])
    end

    it 'has bidder info' do
      expect(auction.bidder_info).to eq({attendee2 => {:budget => 75, :items => [item1]}, 
                                 attendee1 => {:budget => 50, :items => [item1]},
                                 attendee3 => {:budget => 100, :items => [item4]}})
    end

    it 'has a date' do
      require 'date'
      date = Date.today
      allow(auction).to receive(:date).and_return("01/01/2023")
      expect(auction.date).to eq("01/01/2023")
    end

    it 'can close' do
      expect(auction.close_auction).to eq({item1 => attendee1, item4 => attendee3})
    end
  end
end