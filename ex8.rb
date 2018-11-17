# this line defines a variable called "formatter"
#the rest of the code doesn't work without this
#it tells the code how to list a series of items
#the %{} notation is similar to but a little different from the #{} notation
#because the %{} notation allows us to apply the same formatting to multiple strings

formatter = "%{first} %{second} %{third} %{fourth}"

#this defines a list to be expressed in the way definted by "formatter"
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}

#a new list
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}

#another new list, this shows how true / false aren't strings and don't need quotation marks
puts formatter % {first: true, second: false, third: true, fourth: false}

#shows how we can embed the "formatter" variable inside itself?
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}

#replaces each formatter with longer strings
puts formatter % {
  first: "I had this thing.",
  second: "That you could type up right.",
  third: "But it didn't sing.",
  fourth: "So I said goodnight."
}