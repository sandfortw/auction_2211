require './lib/item'
require './lib/attendee'
require './lib/auction'

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
    let(:attendee1) {Attendee.new(name: 'Megan', budget: '$50')}
    let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}

    it '#bids' do
      expect(item1.bids).to eq({})
    end

    it '#can add a bid' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end

    it '#current_high_bid' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.current_high_bid).to eq(22)
    end
  end

end

