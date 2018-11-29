# sets two arguments we need to input at the time we run the file
from_file, to_file = ARGV

#just a simple sentence that explains what the program will do
puts "Copying from #{from_file} to #{to_file}"

# we could do these two on one line, how?

#sets a new "file object" equal to opening the first file, the one we will
#copy from
in_file = open(from_file)

#sets a new variable equal to the contents of the "from_file", by way
#of the "file object" in_file we previously created
indata = in_file.read

#tells us the sength of the file contents
puts "The input file is #{indata.length} bytes long."

#finds out if the output file exists using the .exist
puts "Does the output file exist? #{File.exist?(to_file)}."

#creates a "file object" equal to the destination file
#sets it as writeable but not readable
out_file = open(to_file, 'w')
#writes the contents of the source file to the destination file
out_file.write(indata)

puts "Alright, all done."

#close both files
out_file.close
in_file.close