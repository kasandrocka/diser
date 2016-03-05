require 'bundler'

Bundler.require(:default)
app_files = Dir['lib/**/*.rb']
app_files.each { |f| require_relative f }

customer_parser = CustomerParserService.new(File.join(Dir.pwd, 'data/rc101.csv'))
@customers = customer_parser.parse
@count = @customers.count
@distance_matrix = GenerateDistanceMatrixService.new(@customers, @count).distance_matrix
@test_matrix = [[10000000000,66,16,16],[77,10000000000,71,80],[73,6,10000000000,71],[34,64,18,10000000000]]
brunch_cut = BrunchAndCut.new
@solution = brunch_cut.find_solution(@test_matrix)
