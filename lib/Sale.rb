class Sale
attr_accessor :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id 

  def initialize(attributes_array)
    @id               = attributes_array[0]
    @amount_in_cents  = attributes_array[1]
    @purchase_time    = attributes_array[2]
    @vendor_id        = attributes_array[3]
    @product_id       = attributes_array[4]
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end

   def self.find_by_name(name)  
    all.find do |sale|
      sale.name.downcase =~ /#{name}/i
    end
  end

  def self.find_all_name(name)  
    all.find_all do |sale|
      sale.name.downcase =~ /#{name}/i
    end
  end

  def self.find(market_id)  
    all.find do |sale|
      sale.id.to_i == market_id.to_i
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
end
