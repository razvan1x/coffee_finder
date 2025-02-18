require 'open-uri'
require 'csv'


if ARGV.length != 3
  puts "Forma input: <user x coordinate> <user y coordinate> <shop data url>"
  exit
end

user_x = ARGV[0].to_f  
user_y = ARGV[1].to_f  
shop_data_url = ARGV[2]

begin
  shop_data = URI.open(shop_data_url).read
end

coffee_shops = []

CSV.parse(shop_data, headers: false) do |row|
  name, y_coordinate, x_coordinate = row
  begin
    y_coordinate = y_coordinate.to_f  
    x_coordinate = x_coordinate.to_f  
    coffee_shops << { name: name, y: y_coordinate, x: x_coordinate }
  end
end

def calculate_distance(user_x, user_y, shop_x, shop_y)
  Math.sqrt((shop_x - user_x) ** 2 + (shop_y - user_y) ** 2)
end

coffee_shops_distances = coffee_shops.map do |shop|
  distance = calculate_distance(user_x, user_y, shop[:x], shop[:y])
  { name: shop[:name], distance: distance }
end

closest_shops = coffee_shops_distances.sort_by { |shop| shop[:distance] }.first(3)

closest_shops.each do |shop|
  puts "#{shop[:name]},#{shop[:distance].round(4)}"
end