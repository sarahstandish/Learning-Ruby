first, second, third, fourth = ARGV

puts "Give me the name of a large institution."
first = $stdin.gets.chomp

puts "Give me a noun for a chore."
second = $stdin.gets.chomp

puts "Give me a number."
third = $stdin.gets.chomp

puts "Give me a noun."
fourth = $stdin.gets.chomp

puts """
#{first.capitalize} has finalized its decision
to shutter the Mount Baker #{second} facility that cleans linens
for #{first.capitalize} hospitals, a move that would result in job losses for about #{third}
employees by March. #{first.capitalize} has cited budget shortfalls and
pledged to help workers find new #{fourth}s.
"""
