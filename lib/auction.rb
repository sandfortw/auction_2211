class Auction
require 'date'
  attr_reader :items

  def initialize
    @items = []
    @date = Date.today
    @closed = false
  end

  def add_item(item)
    @closed ? nil : @items << item
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

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.keys.each do |attendee|
        bidders << attendee 
      end
    end
    bidders
  end
  
  def bidder_info
    info = Hash.new{|h,k| h[k] = {}}
    bidders.each do |bidder|
      info[bidder] = {budget: bidder.budget.to_i, items: []}
      @items.each do |item|
        info[bidder][:items] << item if item.bids.keys.include?(bidder)
      end
    end
    info
  end

  def date
    split = @date.to_s.split("-")
    "#{split[2]}/#{split[1]}/#{split[0]}"
  end

  def close_auction
    @closed = true
    sales = {}
    @items.each do |item|
      if item.bids == {}
        sales[item] = 'Not Sold'
      else
      sales[item] = item.bids.sort_by {|k,v| v}.last.first
      end
    end
    sales
  end

end