# # https://projecteuler.net/problem=6

# The sum of the squares of the first ten natural numbers is,

# 1 squred + 2 squared + ... + 10 squared = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def sum_squares(n)
    sum = 0
    for i in 1..n
        sum += (i * i)
    end

    return sum

end

def square_of_sums(n)
    square = 0
    sum = 0
    for i in 1..n 
        sum += i 
    end
            
    square = sum * sum 

    return square

end

puts square_of_sums(100) - sum_squares(100)

