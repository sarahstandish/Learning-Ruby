#this one is like your scripts with ARGV

#this is one way to make a function by first saying that it will take
#a TBD number of arguments
#and then defining those arguments in the body
#the asterisk tells Ruby to take all the arguments and put them in
#args as a list
#not the easiest way to define a function in ruby though
def print_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

#okay, that *args is actually pointless, we can just do this
def print_two_again(arg1, arg2)
  puts "arg1:#{arg1}, arg2: #{arg2}"
end

#this takes just one argument
def print_one(arg1)
  puts "arg1 #{arg1}"
end

#this one takes no arguments
def print_none
  puts "I got nothin."
end

print_two("Zed", "Shaw")
print_two_again("Zed", "Shaw")
print_one("First!")
print_none

#to run, call, or use a function all mean the same thing