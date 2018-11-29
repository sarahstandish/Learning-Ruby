input_file = ARGV.first

#simple function to read and then print the contents of a file
def print_all(f)
  puts f.read
end

#takes the read point back to the zeroth byte
def rewind(f)
  f.seek(0)
end

#function to print one line at a time
#I don't quite understand how it works
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

#creates a file object called current_file
current_file = open(input_file)

puts "First let's print the whole file."

#print the contents
print_all(current_file)

puts "Now let's rewind, kind of like a tape."

#use rewind function
rewind(current_file)

puts "Let's print these three lines."

current_line = 1

3.times do
  print_a_line(current_line, current_file)
  current_line += 1
end