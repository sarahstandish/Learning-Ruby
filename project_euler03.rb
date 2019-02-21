#https://projecteuler.net/problem=3

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143?

require 'pry'

def is_odd(i)
    if i % 2 != 0
        return true
    end
end

def is_a_factor(n, i)
    if n % i == 0
        return true
    end
end

def is_prime(i)
    factors = []
    for x in 3..(i / 2)
        if i % x == 0
            factors << x
        end
    end

    if factors.length == 0
        return true
    end
end


n = 600851475143

for i in (Math.sqrt(n).to_i).downto(3)
    if is_odd(i)
        if is_a_factor(n, i)
            if is_prime(i)
                largest_prime_factor = i 
                break
            end
        end
    end
end

print largest_prime_factor