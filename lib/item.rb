class Item
  attr_reader :name, :bids

  def initialize(name)
    @bids = {}
    @name = name
  end
    
  def add_bid(attendee, bid)
    @bids[attendee] = bid
  end

  def current_high_bid
    @bids.sort_by { |k,v| v}.last[1]
  end

end