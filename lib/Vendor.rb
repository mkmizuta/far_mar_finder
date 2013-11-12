class Vendor

  def initialize(array)

  end

  def self.all
    CSV.read("./support/vendors.csv").each do |array|
      Vendor.new()
    end
  end 

end