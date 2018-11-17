#exercise 9 from Ruby the Hard Way

#string defining the days of the week
days = "Mon Tue Wed Thu Fri Sat Sun"

#string defining the months of the year, putting each item of the list on a separate line
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

#demonstrates another way to create a string, non-interpolated and without escaped characters
#http://ruby-doc.org/core-2.0.0/doc/syntax/literals_rdoc.html#label-Percent+Strings
puts %q{
  There's something going on here
  With this weird quote.
  We'll be able to type as much as we like.
  Even 4 lines if we like, or 5, or 6.
  #{days}
  #{months}
}

#see the difference, with %Q we can interpolate the variables from above
puts %Q{
  There's something going on here
  With this weird quote.
  We'll be able to type as much as we like.
  Even 4 lines if we like, or 5, or 6.
  #{days}
  #{months}
}