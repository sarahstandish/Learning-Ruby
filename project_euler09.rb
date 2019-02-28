# https://projecteuler.net/problem=9

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# a * a + b * b  = (c * c)
# a < b && b < c  

# a + b + c = 1000

def Pythagorean_triplet(m, n)
    a = n * n - m * m
    b = 2 * n * m 
    c = n * n + m * m 
    puts "a: #{a}" 
    puts "b: #{b}"
    puts "c: #{c}"
    puts "sum of a + b + c: #{a + b + c}"
    puts "product of abc: #{a * b * c}"
end

# a = n^2 - m^2
# b = 2nm
# c = n^2 + m^2

#find a, b, and c from n and m...
# 500 = n * m + n * n
m = [*1..20]
n = [*1..20]

sum = 0

m.each do |m|
    n.each do |n|
        sum = (n * m) + (n * n)
        if sum == 500
            puts "m: #{m}, n: #{n}."
            Pythagorean_triplet(m, n)
            break
        end
    end
end

#solved this but I got a bit lucky doing so...