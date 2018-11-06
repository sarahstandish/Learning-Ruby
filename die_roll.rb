# Classes: Die

# This is a variation on the previous Die class.  Rather than hard-coding
# the number of sides to 6, allow the user to initialize a new die with any
# number of sides.  Die#roll will then return a random number between
# 1 and the value the user initialized the die with.

# See the code below from examples.

class Die
  def initialize(sides)
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    @roll = rand 1..@sides.to_i
  end 
  
end


  puts "How many sides does your die have?"
  sides = gets.chomp

  die = Die.new(sides)


  puts "How many times would you like to roll the die?"
  roll_times = gets.chomp
   
  for i in 1..roll_times.to_i
    puts "Roll #{i}: #{die.roll}"
  end
