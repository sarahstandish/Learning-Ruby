name, hometown = ARGV

user_name = "#{name.capitalize} of #{hometown.capitalize}"
def prompt(user_name)
  print "> (Now it's your turn to answer, #{user_name})"
end

puts "Hi #{user_name}."
puts "I'd like to ask you a few questions."
puts "Do you like me, #{user_name}?"
prompt(user_name)
likes = $stdin.gets.chomp

puts "Where do you live, #{user_name}?"
prompt(user_name)
lives = $stdin.gets.chomp

# a comma for puts is like using it twice

puts "What kind of computer do you have? "
prompt(user_name)
computer = $stdin.gets.chomp

puts """
All right, so you said #{likes} about liking me.
You live in #{lives}.  Not sure where that is.
And you have a #{computer} computer.  Nice.
"""