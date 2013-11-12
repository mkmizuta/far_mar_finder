class Product

  # def initialize(array)

  # end

  def self.all
    CSV.read("./support/products.csv").each do |array|
      Product.new()
    end
  end

  def self.find(index)
    data = CSV.open("./support/products.csv", 'r') do |row|
    puts row.select[0]
    end
  end 

  def by_market
    data = CSV.open("./support/products.csv", 'r') do |row|
    puts row.each[1]
    end
  end 

end