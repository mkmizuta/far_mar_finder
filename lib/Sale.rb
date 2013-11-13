class Sale


  def self.all
    CSV.read("./support/sales.csv").each do |array|
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
end
  # def self.find(index)
  #   data = CSV.open("./support/sales.csv", 'r') do |row|
  #   puts row.select[0]
  #   end
  # end 
