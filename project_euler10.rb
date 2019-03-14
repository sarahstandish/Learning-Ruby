# #https://projecteuler.net/problem=10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

def is_prime(i)
    factors = []
    for x in 3..(i / 3)
        if i % x == 0
            factors << x
            if factors.length >= 1
                return false
                break
            end
        end
    end

    if factors.length == 0
        return true
    end
end

sum = 10 #start with 2, 3, 5 already there
i = 7

loop do
    unless i % 5 == 0
        sum += i if is_prime(i)
        i += 2
        if i == 99
            print sum
            break
        end
    end
end 
    