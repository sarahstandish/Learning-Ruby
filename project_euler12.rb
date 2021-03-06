# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

require 'pry'

def is_prime(i)

    factors = []

    for x in 2..(i / 3)
        if i % x == 0
            factors << x
        end
    end

    if factors.length == 0
        return true
    end
end

def find_prime_factors(triangle_number)
    
    prime_factors_array = []
    n = 2
    dividend = triangle_number

    loop do
        quotient = dividend / n
            if dividend % n != 0
                n += 1
            elsif dividend % n == 0 && is_prime(quotient)
                prime_factors_array << n
                prime_factors_array << quotient
                break
            elsif dividend % n == 0
                prime_factors_array << n
                dividend = quotient
            end
        end

    return prime_factors_array

end

def count_factors(prime_factors_array)

    number_of_factors = 1

    prime_factors_array.uniq.each do |prime_factor|
        number_of_factors *= (prime_factors_array.count(prime_factor) + 1)
    end

    return number_of_factors

end


#count_factors(find_prime_factors(3))

more_factors_than = 500

n = 10000

loop do 
    triangle_number = (n * (n + 1)) / 2
    if triangle_number.digits[0] == 0 || triangle_number.digits[0] == 6
        factors = count_factors(find_prime_factors(triangle_number))
        puts "n: #{n}"
        puts "triangle number: #{triangle_number}"
        puts "factors: #{factors}"
        if factors > more_factors_than
            puts triangle_number
            break
        end
        n += 1
    else
    n += 1
    end
end
