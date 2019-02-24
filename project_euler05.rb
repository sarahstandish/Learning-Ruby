# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
# https://projecteuler.net/problem=5

def divisible_by_teens(i)

numbers = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11]

if numbers.all? { |n| i % n == 0 }
  return true
else
  return false
end

end

i = 12252240

loop do 
  if divisible_by_teens(i) == false
  i += 20
  else
  puts i
  break
  end
end
