module TropoUtils
  def self.available_numbers
    tu = ENV['TROPO_USER']
    tp = ENV['TROPO_PASS']
    tp = TropoProvisioning.new(tu, tp)
    exchanges = tp.exchanges
    usa_numbers = []
    toll_free = []
    international = []
    exchanges.each do |exchange|
      if exchange.country == "United States"
        usa_numbers << [exchange.city.to_s + " " + exchange.prefix, exchange.prefix]
      else
        international << [exchange.country + " " + exchange.prefix, exchange.prefix]
      end
    end
    usa_numbers.compact!
    toll_free = usa_numbers.map { |n| ["Toll Free", n[1]] unless n[0]}.compact
    usa_numbers.sort{ |m, n| m[0] <=> n[0]}
  end
end