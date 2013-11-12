class Sale

  # def initialize(array)

  # end

  def self.all
    CSV.read("./support/sales.csv").each do |array|
      Sale.new()
    end
  end

  def self.find(index)
    data = CSV.open("./support/sales.csv", 'r') do |row|
    puts row.select[0]
    end
  end 
end