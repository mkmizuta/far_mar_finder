class Market

  def self.all
    CSV.read("./support/markets.csv").each do |array|
      Market.new()
    end
  end  

  def self.find(index)
    data = CSV.open("./support/markets.csv", 'r') do |row|
    puts row.select[0]
    end
  end
end
