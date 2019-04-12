require 'pry'

# daily programmer from r/dailyprogrammer
# Description
# You have a 2-dimensional rectangular crate of size X by Y, and a bunch of boxes, each of size x by y. The dimensions are all positive integers.


# Given X, Y, x, and y, determine how many boxes can fit into a single crate if they have to be placed so that the x-axis of the boxes is aligned with the x-axis of the crate, and the y-axis of the boxes is aligned with the y-axis of the crate. That is, you can't rotate the boxes. The best you can do is to build a rectangle of boxes as large as possible in each dimension.


# Examples
# fit1(25, 18, 6, 5) => 12
# fit1(10, 10, 1, 1) => 100
# fit1(12, 34, 5, 6) => 10
# fit1(12345, 678910, 1112, 1314) => 5676
# fit1(5, 100, 6, 1) => 0

def fit1(x_crate, y_crate, x_box, y_box)

    x_axis_fit = x_crate / x_box
    y_axis_fit = y_crate / y_box

    total_fit = x_axis_fit * y_axis_fit

    return total_fit

end



def fit2(x_crate, y_crate, x_box, y_box)

    fit1 = fit1(x_crate, y_crate, x_box, y_box)
    fit2 = fit1(x_crate, y_crate, y_box, x_box)

    fit1(x_crate, y_crate, x_box, y_box) > fit1(x_crate, y_crate, y_box, x_box) ? (puts fit1) : (puts fit2)

end

def fit3(x_crate, y_crate, z_crate, x_box, y_box, z_box)
    
    crate_dimensions = [x_crate, y_crate, z_crate]
    
    def determine_fit(crate_dimensions, box_dimensions)
        fit = 1
        crate_dimensions.each_index do |i|
            fit_on_side = crate_dimensions[i] / box_dimensions[i]
            fit *= fit_on_side
        end
        
        return fit
    end

    
    first_rotation = determine_fit(crate_dimensions, [x_box, y_box, z_box])
    second_rotation = determine_fit(crate_dimensions, [x_box, z_box, y_box])
    third_rotation = determine_fit(crate_dimensions, [z_box, x_box, y_box])
    fourth_rotation = determine_fit(crate_dimensions, [z_box, y_box, x_box])
    fifth_rotation = determine_fit(crate_dimensions, [y_box, x_box, z_box])
    sixth_rotation = determine_fit(crate_dimensions, [y_box, z_box, x_box])

    puts [first_rotation, second_rotation, third_rotation, fourth_rotation, fifth_rotation, sixth_rotation].sort[-1]

end

# fit3(10, 10, 10, 1, 1, 1) => 1000
# fit3(12, 34, 56, 7, 8, 9) => 32
#fit3(123, 456, 789, 10, 11, 12) # 32604
#fit3(1234567, 89101112, 13141516, 171819, 202122, 232425) #174648

# Optional bonus fitn
# You upgrade your warehouse to the Nth dimension. Now you take a list of N crate dimensions, and N box dimensions. Assume that the boxes may be rotated in any of N! orientations so that each axis of the crate aligns with a different axis of the boxes. Again, boxes cannot be rotated independently.

# For instance, if the crate is size X = 25 by Y = 18, and the boxes are size x = 6 by y = 5, then the answer is 12. You can fit 4 boxes along the x-axis (because 6*4 <= 25), and 3 boxes along the y-axis (because 5*3 <= 18), so in total you can fit 4*3 = 12 boxes in a rectangle.

# fitn([3, 4], [1, 2]) => 6
# fitn([123, 456, 789], [10, 11, 12]) => 32604
# fitn([123, 456, 789, 1011, 1213, 1415], [16, 17, 18, 19, 20, 21]) => 1883443968

def fitn(crate, box)
    
    permutations_array = box.permutation.to_a

    def get_fit(crate, rotated_box)
        fit = 1
        crate.each_index do |i|
            fit_on_side = crate[i] / rotated_box[i]
            fit *= fit_on_side
        end
        return fit
    end

    fit = 0
    permutations_array.each do |rotated_box|
        boxes = get_fit(crate, rotated_box)
        if boxes > fit
            fit = boxes
        end
    end

    puts fit

end

# fitn([3, 4], [1, 2]) #=> 6
# fitn([123, 456, 789], [10, 11, 12]) #=> 32604
 fitn([123, 456, 789, 1011, 1213, 1415], [16, 17, 18, 19, 20, 21])# => 1883443968
