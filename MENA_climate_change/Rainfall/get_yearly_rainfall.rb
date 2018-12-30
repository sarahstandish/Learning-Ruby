#data from http://sdwebx.worldbank.org/climateportal/index.cfm?page=downscaled_data_download&menu=historical

#this program was written to analyze rainfall datasets from the World Bank
#to redistribute the data from monthly to yearly
#in order to see whether rainfall has decreased or increased from 1901 - 2015
#due to climate change

def get_yearly_rainfall(country, filename)
 
file = File.new(filename, 'r')

all_columns = []

row_count = 0

file.each_line("\n") do |row|
  
  columns = row.chomp.split(",")
  
  all_columns << columns.map(&:to_f)

  #break if file.lineno > 10
  
  row_count += 1
  
end

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

require "csv"
File.write("#{country}_yearly_rainfall.csv", all_columns.map(&:to_csv).join)
end

get_yearly_rainfall("Jordan", 'pr_1901_2015.csv')

get_yearly_rainfall("Yemen", 'yemen_rainfall.csv')

get_yearly_rainfall("Morocco", 'morocco_rainfall.csv')

get_yearly_rainfall("Lebanon", 'lebanon_rainfall.csv')

get_yearly_rainfall("Iraq", 'iraq_rainfall.csv')

get_yearly_rainfall("Gaza Strip", 'gaza_rainfall.csv')

get_yearly_rainfall("Egypt", 'egypt_rainfall.csv')

get_yearly_rainfall("Oman", 'oman_rainfall.csv')

get_yearly_rainfall("Tunisia", 'tunisia_rainfall.csv')

get_yearly_rainfall("UAE", 'uae_rainfall.csv')

get_yearly_rainfall("Syria", 'syria_rainfall.csv')

get_yearly_rainfall("Qatar", 'qatar_rainfall.csv')
