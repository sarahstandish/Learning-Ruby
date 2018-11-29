# exercise 15 from Ruby the Hard Way
# https://learnrubythehardway.org/book/ex15.html

#this line tells us that there is one parameter we need to pass
#when opening the file, and that is the name of the file.
#ARGV.first tells us that there is only one such parameter
#filename is the variable we assign to the name of the file
filename = ARGV.first

#this next line creates a new variable which we have assigned
#to the contents of the file
#now I just learned it's called a "file object"
#using the variable filename we just created
#to stand for the name of the file we are referencing
txt = open(filename)

#this line introduces the user to what's going to happen next
#whcih will be to read the contents of the file
puts "Here's your file #{filename}:"

#this line outputs the text of the file (i.e. reads it) to the console
#it passes the variable txt to the command 'read'
puts txt.read
txt.close

#these two lines ask for user input
#it asks the user to type the filename again
print "Type the filename again: "
#it sets the user input as the value of a new variable, file_again
#we use $stdin.get.chomp instead of just gets.chomp
#because we used ARGV at the top of the file and it works better that way
file_again = $stdin.gets.chomp

#this line sets the value of a new variable, txt_again, equal to
#the contents of the file we just assigned to file_again
#okay, so it's a "file object" and not the contents of the file
txt_again = open(file_again)

#this line commands the program to read the file contents we set as
#equal to txt_again
print txt_again.read
txt_again.close