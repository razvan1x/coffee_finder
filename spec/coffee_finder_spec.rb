require 'open3'
require_relative '../coffee_finder'

RSpec.describe 'Coffee Finder' do
   
  it 'test with valid input' do
    input = "47.6 -122.4 coffee_shops.csv"
    expected_output = <<~OUTPUT
      Starbucks Seattle2,0.0645
      Starbucks Seattle,0.0861
      Starbucks SF,10.0793
    OUTPUT
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to eq(expected_output)
    expect(status.exitstatus).to eq(0)
  end

  it 'test with invalid user coordinates' do
    input = "a b coffee_shops.csv"
    expected_output = "Error: Coordonatele user-ului nu sunt valide\n"
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to eq(expected_output)
    expect(status.exitstatus).to eq(1)
  end

  it 'test with missing column' do
    input = "47.6 -122.4 missing_column.csv"
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to include("Error: Linia 1 din CSV nu are 3 coloane!")
    expect(status.exitstatus).to eq(1)
  end

  it 'test with missing values' do
    input = "47.6 -122.4 missing_value.csv"
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to include("Error: Linia 1 are valori lipsa!")
    expect(status.exitstatus).to eq(1)
  end

  it 'test with an empty CSV file' do
    input = "47.6 -122.4 empty_csv.csv"
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to eq("Error: Fisierul CSV nu contine date\n")
    expect(status.exitstatus).to eq(1)
  end

  it 'test with invalid coordinates in CSV' do
    input = "47.6 -122.4 invalid_coordinates.csv" 
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to include("Error: Linia 1 contine coordonate invalide!")
    expect(status.exitstatus).to eq(1)
  end
  
  it 'test without arguments' do
    input = ""  
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to include("Forma input: <user x coordinate> <user y coordinate> <shop data url>")
    expect(status.exitstatus).to eq(1)  
  end
  
  it 'test with too many arguments' do
    input = "47.6 -122.4 extra_argument https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv"
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to include("Forma input: <user x coordinate> <user y coordinate> <shop data url>")
    expect(status.exitstatus).to eq(1)  
  end

  describe '#calculate_distance' do
    it 'calculates the correct distance between two points' do
      user_x = 47.6
      user_y = -122.4
      shop_x = 47.5809
      shop_y = -122.3160
      
      distance = calculate_distance(user_x, user_y, shop_x, shop_y)
      expect(distance.round(4)).to eq(0.0861) 
    end
  end

end