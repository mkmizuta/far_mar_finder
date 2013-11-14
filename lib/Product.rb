class Product
attr_accessor  :id, :name, :vendor_id

  def initialize(attributes_array)
    @id         = attributes_array[0].to_i
    @name       = attributes_array[1]
    @vendor_id  = attributes_array[2].to_i
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

  # `vendor` - returns the `Vendor` instance that is associated with this vendor using the `Product` `vendor_id` field

  def vendor
    Vendor.find(@vendor_id)
  end

  # `sales` - returns a collection of `Sale` instances that are associated with market using the `Sale` `product_id` field.

  def sales
    Sale.find_all_by_product_id(@id)
  end

  #   `number_of_sales` - returns the number of times this product has been sold.

  def number_of_sales
    Sale.find_all_by_product_id(@id).count
  end

  # # - `self.by_vendor(vendor_id)` - returns all of the products with the given `vendor_id`

  def self.by_vendor(vendor_id)
    all.find_all do |product|
      product.vendor_id.to_i == vendor_id.to_i
    end
  end
end
