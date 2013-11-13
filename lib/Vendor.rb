class Vendor
attr_accessor :id, :name, :no_of_employees, :market_id

  def initialize(attributes_array)
      @id               = attributes_array[0]
      @name             = attributes_array[1]
      @no_of_employees  = attributes_array[2]
      @market_id        = attributes_array[3]
  end

  def self.all
    CSV.read("./support/vendors.csv").map do |array|
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

  def market
    Market.find(@market_id)
  end

  #- `products` - returns a collection of `Product` instances that are associated with market by the `Product` `vendor_id` field.
  def products
    Product.find_all_by_vendor_id(@id)
  end

# `sales` - returns a collection of `Sale` instances that are associated with market by the `vendor_id` field.
  def sales

  end

  def revenue
  end

  
end

# def self.find(index)
#     data = CSV.open("./support/vendors.csv", 'r') do |row|
#     puts row.select[0]
#     end
#   end 