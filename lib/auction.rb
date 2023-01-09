class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpopulars = []
    @items.each do |item|
      unpopulars << item if item.bids == {}
    end
    unpopulars
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid
    end
      revenue
  end
end