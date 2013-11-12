class Market

  # def initialize

  # end

  def self.all
    CSV.read("./support/markets.csv").each do |array|
      Market.new()
    end
  end   
end