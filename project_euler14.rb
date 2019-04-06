# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

require 'pry'

count = 1
starting_term = 1000000
n = 1000000
sequence_hash = {}

loop do
    if n % 2 == 0
        n /= 2
    else 
        n = 3 * n + 1
    end
    count += 1
    if n == 1
        sequence_hash[starting_term] = count
        starting_term -= 1
        n = starting_term
        count = 1
        if starting_term == 1
            sequence_hash = sequence_hash.sort_by { |k, v| v }
                print sequence_hash[-1]
            break
        end
    end
end

