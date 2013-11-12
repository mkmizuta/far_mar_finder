require 'csv'
require 'time'
require_relative 'market'
require_relative 'Vendor'
require_relative 'Sale'
require_relative 'Product'
# ... Require all of the supporting classes

class FarMarFinder
  def markets
    finder = Market.new()
    return Market
  end

  def vendors
    finder = Vendor.new()
    return Vendor
  end

  def sales
    finder = Sale.new()
    return Sale
  end

  def products
    finder = Product.new()
    return Product
  end

end