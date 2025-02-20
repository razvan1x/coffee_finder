require 'open3'

RSpec.describe 'Coffee Finder' do
  let(:csv_file) { 'https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv' }  
  it 'test with valid input' do
    input = "47.6 -122.4 #{csv_file}"
    expected_output = <<~OUTPUT
      Starbucks Seattle2,0.0645
      Starbucks Seattle,0.0861
      Starbucks SF,10.0793
    OUTPUT
    stdout, stderr, status = Open3.capture3("ruby coffee_finder.rb #{input}")
    expect(stdout).to eq(expected_output)
    expect(status.exitstatus).to eq(0)
  end

end