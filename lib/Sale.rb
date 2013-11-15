class Sale
attr_accessor :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id 

  def initialize(attributes_array)
    @id               = attributes_array[0].to_i
    @amount_in_cents  = attributes_array[1].to_i
    @purchase_time    = Time.parse(attributes_array[2])
    @vendor_id        = attributes_array[3].to_i
    @product_id       = attributes_array[4].to_i
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end

  def self.find(id)  
    all.find do |sale|
      sale.id.to_i == id.to_i
      end
  end

  def self.find_all_by_vendor_id(vendor_id)
    all.find_all do |sale|
      sale.vendor_id.to_i == vendor_id.to_i
    end
  end

  def self.sales_sum_in_cents(vendor_id)
    sum = 0
    all_sales_for_vendor = find_all_by_vendor_id(vendor_id)
    all_sales_for_vendor.map do |sale|
      sum = sum + sale.amount_in_cents.to_i
    end
      return sum
  end

  def self.find_all_by_product_id(product_id)  
    all.find_all do |sale|
      sale.product_id.to_i == product_id.to_i
    end
  end

  #   `vendor` - returns the `Vendor` instance that is associated with this sale using the `Sale` `vendor_id` field

  def vendor
    Vendor.find(@vendor_id)
  end

  # - `product` - returns the `Product` instance that is associated with this sale using the `Sale` `product_id` field

  def product
    Product.find(@product_id)
  end

  # # - `self.between(beginning_time, end_time)` - returns a collection of Sale objects where the purchase time is between the two times given as arguments

  def self.between(beginning_time, end_time)
    all.find_all { |sale| sale.purchase_time.between?( Time.parse(beginning_time), Time.parse(end_time) )}
  end

   def amount
    @amount_in_cents
  end
end

    




