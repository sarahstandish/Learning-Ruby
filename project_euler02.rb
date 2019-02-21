# #https://projecteuler.net/problem=2

# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

fib_numbers = [1, 2]

loop do
    i = fib_numbers[-1] + fib_numbers[-2]
    break if i > 4000000
    fib_numbers << i
end

even_sum = 0

fib_numbers.each do |n|
    if n % 2 == 0
        even_sum += n
    end
end

puts even_sum
