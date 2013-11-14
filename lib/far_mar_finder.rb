require 'csv'
require 'time'
require_relative 'market'
require_relative 'Vendor'
require_relative 'Sale'
require_relative 'Product'
# ... Require all of the supporting classes

class FarMarFinder
  def markets
    array = ["1", "People's Co-op Farmers Market", "30th and Burnside", "Portland", "Multnomah", "Oregon", "97202"]
    finder = Market.new(array)
    return Market
  end

  def vendors
    array = ["1", "Feil-Farrell", "8", "1"]
    finder = Vendor.new(array)
    return Vendor
  end

  def sales
    array = ["1", "9290", "2011-03-31 02:47:56 -0700", "1", "1"]
    finder = Sale.new(array)
    return Sale
  end

  def products
    array = ["1", "Dry Beets", "1"]
    finder = Product.new(array)
    return Product
  end

end