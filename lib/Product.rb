class Product

  def initialize(array)

  end

  def self.all
    CSV.read("./support/products.csv").each do |array|
      Product.new()
    end
  end
end