class Market

  def initialize(array)

  end

  def self.all
    CSV.read("./support/markets.csv").each do |array|
      Market.new()
    end
  end   
end