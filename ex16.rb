filename = ARGV.first

puts "We're going to erase #{filename}."
puts "If you don't want to do that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

#what I understand here is that this is just the user agreeing to proceed
#by pressing enter
#we haven't set the user input as equal to anything
#just told the program to pause and wait for it
$stdin.gets

puts "Opening the file and erasing contents..."
target = open(filename, 'w+')

puts "How many lines would you like to add?"
lines = $stdin.gets.chomp

puts "Now I'm going to ask you for #{lines} lines."

all_lines = []

for i in 1..lines.to_i do
  print "line #{i}:"
  line = $stdin.gets.chomp
  all_lines.push(line)
end

puts "I'm going to write these lines to the file."
all_lines.each do |l|
  target.write(l + "\n")
end

puts "Here is what your file says now."
puts target.read

puts "And finally, we close it."
target.close