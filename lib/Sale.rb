class Sale

  def initialize(array)

  end

  def self.all
    CSV.read("./support/sales.csv").each do |array|
      Sale.new()
    end
  end
end