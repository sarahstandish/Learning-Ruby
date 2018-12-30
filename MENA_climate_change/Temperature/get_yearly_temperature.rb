#data from http://sdwebx.worldbank.org/climateportal/index.cfm?page=downscaled_data_download&menu=historical

#this program was written to analyze rainfall datasets from the World Bank
#to redistribute the data from monthly to yearly
#in order to see whether rainfall has decreased or increased from 1901 - 2015
#due to climate change

def get_yearly_temperature(country, filename)
 
file = File.new(filename, 'r')

all_columns = []

row_count = 0

file.each_line("\n") do |row|
  
  columns = row.chomp.split(",")
  
  all_columns << columns.map(&:to_f)

  row_count += 1
  
end

all_columns.delete_at(0)

i = 0
loop do
break if i == all_columns.length - 1
 if all_columns[i][1] == all_columns[i + 1][1]
   all_columns[i][0] = all_columns[i][0] + all_columns[i + 1][0]
   all_columns.delete_at(i + 1)
  else
  i += 1
 end
end

all_columns.each do |inner_array|
  inner_array[0] = inner_array[0] / 12
end

require "csv"
File.write("#{country}_yearly_temperature.csv", all_columns.map(&:to_csv).joino)
end

get_yearly_temperature("jordan", 'jordan_temperature.csv')
get_yearly_temperature("Oman", 'oman_temperature.csv')
get_yearly_temperature("algeria", 'algeria_temperature.csv')