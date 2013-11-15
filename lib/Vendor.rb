class Vendor
attr_accessor :id, :name, :no_of_employees, :market_id

  def initialize(attributes_array)
      @id               = attributes_array[0].to_i
      @name             = attributes_array[1]
      @no_of_employees  = attributes_array[2].to_i
      @market_id        = attributes_array[3].to_i
  end

  def self.all
    @all_vendors ||= CSV.read("./support/vendors.csv").map do |array|
      Vendor.new(array)
    end
  end 

  def self.find_by_name(name)  
    all.find do |vendor|
    vendor.name.downcase =~ /#{name}/i
    end
  end

  def self.find_all_name(name)  
    all.find_all do |vendor|
    vendor.name.downcase =~ /#{name}/i
    end
  end

  def self.find(id)  
    all.find do |vendor|
      vendor.id.to_i == id.to_i
    end
  end

  def self.find_all_market_id(market_id)  
    all.find_all do |vendor|
      vendor.market_id.to_i == market_id.to_i
    end
  end

  # - `market` - returns the `Market` instance that is associated with this vendor using the `Vendor` `market_id` field

  def market
    Market.find(@market_id)
  end

  #- `products` - returns a collection of `Product` instances that are associated with market by the `Product` `vendor_id` field.

  def products
    Product.find_all_by_vendor_id(@id)
  end

  # `sales` - returns a collection of `Sale` instances that are associated with market by the `vendor_id` field.

  def sales
    Sale.find_all_by_vendor_id(@id)
  end

  # `revenue` - returns the the sum of all of the vendor's sales (in cents)

  def revenue
    Sale.sales_sum_in_cents(@id)
  end

  # `self.by_market(market_id)` - returns all of the vendors with the given `market_id`  ### >>> by_market_id to by_market

  def self.by_market(market_id)
    all.find_all do |vendor|
      vendor.market_id.to_i == market_id.to_i
    end  
  end
end
