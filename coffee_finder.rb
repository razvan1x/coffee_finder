require 'open-uri'
require 'csv'


#Verificare argumente
if ARGV.length != 3
  puts "Forma input: <user x coordinate> <user y coordinate> <shop data url>"
  exit
end

begin
  user_x = Float(ARGV[0])
  user_y = Float(ARGV[1])
rescue ArgumentError
  puts "Error: Coordonatele user-ului nu sunt valide"
  exit
end

shop_data_url = ARGV[2]

begin
  shop_data = URI.open(shop_data_url).read
rescue => e
  puts "Eroare la descarcarea datelor: #{e.message}"
  exit
end

coffee_shops = []

#Parsare CSV
CSV.parse(shop_data, headers: false).each_with_index do |row, index|
  if row.length != 3
    puts "Error: Linia #{index + 1} din CSV nu are 3 coloane!"
    exit
  end

  name, x_coordinate, y_coordinate = row

  if name.nil? || x_coordinate.nil? || y_coordinate.nil?
    puts "Error: Linia #{index + 1} are valori lipsa!"
    exit
  end

  begin
    x_coordinate = Float(x_coordinate)
    y_coordinate = Float(y_coordinate)
  rescue ArgumentError
    puts "Error: Linia #{index + 1} contine coordonate invalide!"
    exit
  end

  coffee_shops << { name: name, x: x_coordinate, y: y_coordinate }
end

if coffee_shops.empty?
  puts "Error: Fisierul CSV nu contine date"
  exit
end

#Formula euclidiana pentru calculul distantei
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