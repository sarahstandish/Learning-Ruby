# Method name: to_english
# Inputs:      A number
# Returns:     A String representing the number in English
# Prints:      Nothing

# Write a method that takes a positive integer as input and returns the input
# in "plain English."  For example,
#
#   to_english(1)     == "one"
#   to_english(12)    == "twelve"
#   to_english(123)   == "one hundred twenty three"
#   to_english(1234)  == "one thousand two hundred thirty four"
#   to_english(12345) == "twelve thousand three hundred forty five"
#
# You can decide the largest power of 10 you wish to support, but you should
# support at least up to the billions.

# Hint #1
# Write down a bunch of examples and look for patterns.
# What words make up "special cases?" There are likely fewer than you think
# if you can find ways to combine simpler patterns into larger ones.

# from https://github.com/codeunion/ruby-exercises/blob/master/exercises/to_english.rb

def to_english(number)
single_digits = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
  }
 teens = {
    "zero" => "ten",
    "one" => "eleven",
    "two" => "twelve",
    "three" => "thirteen",
    "four" => "fourteen",
    "five" => "fifteen",
    "six" => "sixteen",
    "seven" => "seventeen",
    "eight" => "eighteen",
    "nine" => "nineteen"
  }
  tens = {
    0 => "zero",
    2 => "twenty",
    3 => "thirty",
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }


each_number = number.to_s.split("").reverse

each_number.each_with_index do |n, i|
  if i == 0 || i == 2 || i == 3 || i == 5 || i == 6 || i == 8 || i == 9
    each_number[i].replace(single_digits.fetch(each_number[i].to_i))
  elsif i == 1 && n != "1"
    each_number[i].replace(tens.fetch(each_number[i].to_i))
  elsif i == 1 && n == "1"
    each_number[0].replace(teens.fetch(each_number[0]))
    each_number[i].replace("zero")
  elsif i == 4 && n != "1"
    each_number[i].replace(tens.fetch(each_number[i].to_i))
  elsif i == 4 && n == "1"
    each_number[i - 1].replace(teens.fetch(each_number[i - 1]))
    each_number[i].replace("zero")
  elsif i == 7 && n != "1"
    each_number[i].replace(tens.fetch(each_number[i].to_i))
  elsif i == 7 && n == "1"
    each_number[i - 1].replace(teens.fetch(each_number[i - 1]))
    each_number[i].replace("zero")
  end
end

each_number.each_with_index do |n, i|
  if i == 2
    each_number[i] = n + " hundred"
  elsif i == 3
    each_number[i] = n + " thousand"
  elsif i == 4 && each_number[i - 1].match?(/zero/)
    each_number[i] = n + " thousand"
  elsif i == 5 
    if each_number[i - 1].match?(/zero/) && each_number[i - 2].match?(/zero/)
    each_number[i] = n + " hundred thousand"
    else 
    each_number[i] = n + " hundred"
    end
  elsif i == 6
    each_number[i] = n + " million"
  elsif i == 7 && each_number[i - 1].match?(/zero/)
    each_number[i] = n + " million"
  elsif i == 8
       if each_number[i - 1].match?(/zero/) && each_number[i - 2].match?(/zero/)
    each_number[i] = n + " hundred million"
    else 
    each_number[i] = n + " hundred"
    end

  elsif i == 9
    each_number[i] = n + " billion"
  end
end

i = 0
until i == each_number.length
  if each_number[i].match?(/zero/)
    each_number.delete_at(i)
  else
    i += 1
  end
end

return each_number.reverse.join(" ")

end

to_english(1234500000)