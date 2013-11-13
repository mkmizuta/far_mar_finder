class Product
attr_accessor  :id, :name, :vendor_id

  def initialize(attributes_array)
    @id         = attributes_array[0]
    @name       = attributes_array[1]
    @vendor_id  = attributes_array[2]
  end  

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def self.find_by_name(name)  
    all.find do |product|
      product.name.downcase =~ /#{name}/i
    end
  end

  def self.find_all_name(name)  
    all.find_all do |product|
      product.name.downcase =~ /#{name}/i
    end
  end

  def self.find(id)  
    all.find do |product|
      product.id.to_i == id.to_i
    end
  end

  def self.find_all_by_vendor_id(vendor_id)
    all.find_all do |product|
      product.vendor_id.to_i == vendor_id.to_i
    end
  end
end




#   def self.find(index)
#     data = CSV.open("./support/products.csv", 'r') do |row|
#     puts row.select[0]
#     end
#   end 

#   def by_market
#     data = CSV.open("./support/products.csv", 'r') do |row|
#     puts row.each[1]
#     end
#   end 

# end