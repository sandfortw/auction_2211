class Item
  attr_reader :name

  def initialize(name)
    @bids = {}
    @name = name
  end
    
  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end


end