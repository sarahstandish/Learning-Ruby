# Method name: to_roman
# Inputs:      A number
# Returns:     A String representing the number in roman numerals
# Prints:      Nothing

# to_roman takes a number as input and returns that number using Roman numerals
# See http://en.wikipedia.org/wiki/Roman_numerals


#from https://github.com/codeunion/ruby-exercises/blob/master/exercises/to_roman.rb

def to_roman(num)

ones = {
  0 => "",
  1 => "I",
  2 => "II",
  3 => "III",
  4 => "IV",
  5 => "V",
  6 => "VI",
  7 => "VII",
  8 => "VIII",
  9 => "IX"
}

tens = {
  0 => "",
  1 => "X",
  2 => "XX",
  3 => "XXX",
  4 => "XL",
  5 => "L",
  6 => "LX",
  7 => "LXX",
  8 => "LXXX",
  9 => "XC"
}

hundreds = {
  0 => "",
  1 => "C",
  2 => "CC",
  3 => "CCC",
  4 => "CD",
  5 => "D",
  6 => "DC",
  7 => "DCC",
  8 => "DCCC",
  9 => "CM"
}

num_array = num.to_s.split("").reverse

print num_array

if num_array.length > 3
  until num_array.length == 4
  num_array[3] = num_array[4] + num_array[3]
  num_array.delete_at(4)
  end
end

def thousands(n)

roman_thousands = ""
  n.to_i.times do
    roman_thousands = roman_thousands + "M"
  end

return roman_thousands

end

print num_array


num_array.each_with_index do |n, i|
  if i == 0
    num_array[i].replace(ones.fetch(num_array[i].to_i))
  elsif i == 1
    num_array[i].replace(tens.fetch(num_array[i].to_i))
  elsif i == 2
    num_array[i].replace(hundreds.fetch(num_array[i].to_i))
  elsif i == 3
    num_array[i].replace(thousands(n))
  end
end

num_array.delete("")

return num_array.reverse.join

end