# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

require 'pry'

n = 2

raised_to = 1000

(raised_to - 1).times do
    n *= 2
end

sum = 0

n.to_s.split("").each do |digit|
    sum += digit.to_i
end

puts sum
