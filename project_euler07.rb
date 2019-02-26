# https://projecteuler.net/problem=7

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?


def is_prime(i)
    factors = []
    for x in 3..(i / 3)
        if i % x == 0
            factors << x
        end
    end

    if factors.length == 0
        return true
    end
end

primes = [2]

i = 3
loop do
    if is_prime(i)
        primes << i 
    end
    i += 2
    break if primes.length == 10001
end

puts primes[-1]