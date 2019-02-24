#https://projecteuler.net/problem=4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# 999*999 = 998001 so the number won't be larger than six digits
# 100 * 100 = 10000 so the smallest the number could potentially be is five digits, but since we're looking for the largest number I think it's more likely to be six digits

#so there are two steps here: first to find palindromic numbers, then to see if they are the product of two three-digit numbers

require 'pry'

def is_a_palindrome(i)
    if i.to_s[0..2] == i.to_s.reverse[0..2]
        return true
    end
end

# def three_digit_product(i)
#     for n in 999.downto(100)
#         x = i / n
#         if i % n == 0 && x.to_s.length == 3
#             puts i
#             puts n 
#             puts x
#             return true
#         else
#             next
#             return false
#         end
#     end
# end


for i in 998001.downto(100000)
    if is_a_palindrome(i)
        for n in 999.downto(100)
            x = i / n
            if i % n == 0 && x.to_s.length == 3
                largest_palindrome = i
            end
            break if largest_palindrome != nil
        end
    end
end

print largest_palindrome
    