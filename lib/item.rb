class Item
  attr_reader :name, :bids

  def initialize(name)
    @bids = {}
    @name = name
    @closed = false
  end
    
  def add_bid(attendee, bid)
    @closed ? nil : @bids[attendee] = bid
  end

  def current_high_bid
    if @bids != {}
      @bids.sort_by { |k,v| v}.last[1]
    else
      0
    end
  end

  def close_bidding
    @closed = true
  end
end