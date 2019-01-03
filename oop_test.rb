# from exercise 41 in Learn Ruby the Hard Way

#https://learnrubythehardway.org/book/ex41.html

#this is my comments as a form of trying to understand the code written for this exercise

require 'open-uri' #allows ruby to parse html
require 'pry'

WORD_URL = "http://learncodethehardway.org/words.txt" #creates a variable called WORD_URL which is equal to the above URL
WORDS = [] #creates an empty words array
#the capitalization shows this is an important variable that doesn't change
#i think...

PHRASES = { #creates an array to contain phrases relevant to coding
    "class ### < ###]\nend" => "Make a class named ### that is-a ###",
    "class ###\ndef initialize(@@@)\nend\end" => "class ### has-a initialized that takes @@@ parameters",
    "class ###\n def ***(@@@)\nend\nend" => "class ### has-a function named *** that takes @@@ parameters",
    "*** = ###.new" => "Set *** to an instance of class ###",
    "***.***(@@@)" => "From *** get the *** function and call it with parameters @@@",
    "***.*** = '***'" => "From *** get the *** attribute and set it to '***'"
}

PHRASE_FIRST = ARGV[0] == "english"
#ARGV stands for "argument vector" which is the arguments passed to the program through the command line
#it is an array, in this case however it is only taking a single string
#so it is an array of strings with a length of one
#we can use any of the normal array methods on it
#argv[0] stands for the first argument passed to the program
#so we are creating an array called PHRASE FIRST which is equal to the first argument passed to the program through the command line
#you could use if argv.empty? to check if the user failed to pass in any arguments
#here it means that if the user passes the argument "english" it will trigger conditions called "phrase first"

open(WORD_URL) do |f| #open the url set equal to WORD URL above
    f.each_line do |word| #check each line and do something to the contents of that line
        WORDS.push(word.chomp) #add the contents of each line, minus the newline at the end, to the WORDS array
    end
end

def craft_names(rand_words, snippet, pattern, caps=false) #creates a new function craft_names which takes four arguments
    names = snippet.scan(pattern).map do #creates a new array called names which consists of something done to snippets of text which match a "pattern" string
        word = rand_words.pop #the word variable is set equal to the last element of the rand_words array
        caps ? word.capitalize : word #could be rewritten as if word.capitalize then caps else word
    end
    return names * 2 #returns the names array twice
end

def craft_params(rand_words, snippet, pattern)
    names = (0...snippet.scan(pattern).length).map do 
        param_count = rand(3) + 1 #parameter count is a random number between 1 and 4
        params = (0...param_count).map { |x| rand_words.pop } #creates an array called params which is the result of the last few words of the rand_words array, defined by the param_count variable
        params.join(', ') #join the params into a string with a comma in between
    end

    return names * 2
end

def convert(snippet, phrase)
    rand_words = WORDS.sort_by {rand} #creates the rand_words array which is the WORDS array sorted randomly
    class_names = craft_names(rand_words, snippet, /###/, caps=true)
    #create a class names array by running the craft names function and passing in the arguments rand words, snippet, and pattern arguments
    other_names = craft_names(rand_words, snippet, /\*\*\*/)
    #create an arra for anything that isn't a class or parameter name
    param_names = craft_params(rand_words, snippet, /@@@/)
    #create a parameter names array

    results = [] #create an empty array to hold the results

    [snippet, phrase].each do |sentence|
        #fake class names, also copies sentence
        #creates a results variable which will store the result of a sentence modified by subbing in the last class name of the class names array in for /###/
        result = sentence.to_s.gsub(/###/) { |x| class_names.pop }

        #fake other names
        #further modify the same variable, result, by substituting other names for any *** string
        result.gsub!(/\*\*\*/) { |x| other_names.pop}
        
        #further modifies the same sentence by substituting the last parameter name for @@@
        #fake parameter lists
        result.gsub!(/@@@/) { |x| param_names.pop }

        results.push(result) #add final sentence with substitutions to the results array
        
    end

    return results #return the results array
end

loop do 
    #creates an array called snippets consisting of the keys of the phrases array, randomly sorted
    snippets = PHRASES.keys.sort_by {rand} 
    
    #binding.pry

    for snippet in snippets
        phrase = PHRASES[snippet] #defines phrase as the value of the key in the PHRASES hash with snippet as the key
        question, answer = convert(snippet, phrase) #calls on the convert method to convert the symbols in the sentence to names
        #if the phrase first condition was met, reverse the order

        #binding.pry

        if PHRASE_FIRST
            question, answer = answer, question
        end

        #print the question
        print question, "\n\n"

        #if the user presses enter, displays the answer
        exit(0) unless $stdin.gets
        puts "\nANSWER: #{answer}\n\n"
    end
end