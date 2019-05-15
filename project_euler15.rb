# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

require 'pry'

def create_grid(height, width)
    grid = []

    height.times do 
        grid.push("d")
    end

    width.times do
        grid.push("r")
    end

    return grid
end

all_permutations = create_grid(20, 20).permutation.to_a


def delete_extraneous_paths(all_permutations)

    all_paths = []
    until all_permutations.empty?
    all_permutations.each do |permutation|
        all_paths << permutation
        all_permutations.delete(permutation)
        # puts "all paths: #{all_paths}"
        # puts "all permutations: #{all_permutations}"
    end
    end

    puts all_paths.length
end

delete_extraneous_paths(all_permutations)