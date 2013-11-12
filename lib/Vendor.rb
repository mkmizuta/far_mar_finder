class Vendor

  # def initialize(array)

  # end

  def self.all
    CSV.read("./support/vendors.csv").each do |array|
      Vendor.new()
    end
  end 

  def self.find(index)
    data = CSV.open("./support/vendors.csv", 'r') do |row|
    puts row.select[0]
    end
  end 
end