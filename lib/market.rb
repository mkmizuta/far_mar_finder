require 'csv'

class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip 

  def initialize(attributes_array)
    @id       = attributes_array[0].to_i
    @name     = attributes_array[1]
    @address  = attributes_array[2]
    @city     = attributes_array[3]
    @county   = attributes_array[4]
    @state    = attributes_array[5]
    @zip      = attributes_array[6]
  end

  def self.all
    @all_market ||= CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end 

 def self.find_by_name(name)  
    all.find do |market|
    market.name.downcase =~ /#{name}/i
    end
  end

  def self.find_all_name(name)  
    all.find_all do |market|
    market.name.downcase =~ /#{name}/i
    end
  end

  def self.find(market_id)  
    all.find do |market|
      market.id.to_i == market_id.to_i
      end
  end

  def vendors
    Vendor.find_all_market_id(@id)
  end

  def self.random
    self.find(rand(all.count))
  end
end

