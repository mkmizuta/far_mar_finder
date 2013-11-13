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

  #  def self.find_by_name(name)  
  #   all.find do |sale|
  #     sale.name.downcase =~ /#{name}/i
  #   end
  # end

  # def self.find_all_name(name)  
  #   all.find_all do |sale|
  #     sale.name.downcase =~ /#{name}/i
  #   end
  # end

  def self.find(market_id)  
    all.find do |sale|
      sale.id.to_i == market_id.to_i
      end
  end
end
  # def self.find(index)
  #   data = CSV.open("./support/sales.csv", 'r') do |row|
  #   puts row.select[0]
  #   end
  # end 
