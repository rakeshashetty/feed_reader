require 'rss'
require 'open-uri'
class Feed < ActiveRecord::Base
  attr_accessible :name, :feed_url
  
  validates :name, :feed_url, presence: true
  
  def items  
    RSS::Parser.parse(open(feed_url).read, false).items
  end

  def sorted
  	items.sort_by { |item| item.pubDate }.reverse!
  end

  def self.recent_items
  	all.map{ |feed| feed.items}.flatten.sort_by { |item| item.pubDate }.reverse!
  end
end