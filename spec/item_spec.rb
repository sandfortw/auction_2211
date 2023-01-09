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

  describe 'bidding' do
    let(:item2) {Item.new('Bamboo Picture Frame')}
    let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
    let(:item4) {Item.new('2 Days Dogsitting')}
    let(:item5) {Item.new('Forever Stamps')}
    let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}
    let(:attendee3) {Attendee.new(name: 'Mike', budget: '$100')}
    let(:auction) {Auction.new}

    it '#bids' do
      expect(item1.bids).to eq({})
    end

    it '#can add a bid' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to eq{attendee2 => 20, attendee1 => 22}
    end

    it '#current_high_bid' do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item.current_high_bid).to eq(22)
    end

  end

end

