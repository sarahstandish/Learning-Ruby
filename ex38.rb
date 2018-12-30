#exercise 38 from Ruby the Hard Way
#https://learnrubythehardway.org/book/ex38.html

ten_things = "apples oranges crows telephone light sugar"

puts "Wait there aren't ten things there."

stuff = ten_things.split(' ')

more_stuff = %w(day night song frisbee corn banana girl boy)

while stuff.length != 10
    next_one = more_stuff.pop #removes the last element of the array and returns it
    puts "Adding #{next_one}"
    stuff.push(next_one)
    puts "There are #{stuff.length} items now"
end

puts "There we go: #{stuff}"

puts "Let's do some things with it."

puts stuff[1] #oranges
puts stuff[-1] #corn
puts stuff.pop #corn
puts stuff.join(' ') #all elements with spaces in between
puts stuff[3..5].join("#") # telephone light sugar