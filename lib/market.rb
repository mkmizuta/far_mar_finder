require 'csv'

class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip 

  def initialize(attributes_array)
    @id       = attributes_array[0]
    @name     = attributes_array[1]
    @address  = attributes_array[2]
    @city     = attributes_array[3]
    @county   = attributes_array[4]
    @state    = attributes_array[5]
    @zip      = attributes_array[6] 
  end

  def self.all
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end 


 def self.find_by_name(name)  
    all.find.casecmp do |market|
    market.name =~ /name/
    end
  end
end

  # def self.find(market_id)  
  #   all.find do |market|
  #     market.id.to_i == market_id.to_i
  #     end
  # end

# end





  

#   def self.find(index)
#     data = CSV.open("./support/markets.csv", 'r') do |row|
#     puts row.select[0]
#     end
#   end
# end

# puts Market.all.count 


# puts Market.find(id)
