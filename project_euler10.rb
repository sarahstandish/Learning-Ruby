# #https://projecteuler.net/problem=10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require 'pry'

primes_under = 2000000
numbers_array = [*2..primes_under]

#this is based on the seive of erosthenes https://www.geeksforgeeks.org/sieve-of-eratosthenes/
def remove_non_primes(numbers_array)
    x = 2
    loop do 
        numbers_array.delete_if do |n|
            n >= (x * x) && n % x == 0
        end
        break if (x * x) > numbers_array[-1]
        x += 1
    end
    return numbers_array

end

def sum_array(numbers_array)
    sum = 0
    numbers_array.each {|n| sum += n}
    print sum
end

sum_array(remove_non_primes(numbers_array))


# this works for small number but it's too slow, doesn't work for 2 million
# def is_prime(i)

#     for x in 3..(i / 3)
#         if i % x == 0
#             return false
#             break
#         end
#     end

#     true
# end

# sum = 10 #start with 2, 3, 5 already there
# i = 7
# primes_under = 2000000

# loop do
#     unless i % 5 == 0
#         sum += i if is_prime(i)
#     end
#     i += 2
#     if i > primes_under
#         print sum
#         break
#     end
# end 