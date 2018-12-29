#From "Learn Ruby the Hard Way" https://learnrubythehardway.org/book/ex37.html

#This is a chance to go over and study some key Ruby terms.

key_terms = {
    "BEGIN"	=> "Run this block when the script starts.	__________ { puts \"hi\" }",
    "END"	=> "Run this block when the script is done.	__________ { puts \"hi\" }",
    "alias"	=> "Create another name for a function.	__________ X Y",
    "and"	=> "Logical and, but lower priority than &&.",
    "begin"	=> "Start a block, usually for exceptions.	__________ end",
    "case"	=> "Style conditional, like an if.	_________ X; when Y; else; end",
    "defined?"	=> "Is this class/function/etc. defined already?",
    "ensure"	=> "Run this code whether an exception happens or not.",
    "next"	=> "Skip to the next element of a .each iterator.",
    "redo"	=> "Rerun a code block exactly the same.",
    "rescue"	=> "Run this code if an exception happens.",
    "retry"	=> "In a rescue clause, says to try the block again.",
    "self"	=> "The current object, class, or module.",
    "super"	=> "The parent class of this class.",
    "then"	=> "Can be used with if optionally.",
    "undef"	=> "Remove a function definition from a class.",
    "unless"	=> "Inverse of if.",
    "until"	=> "Inverse of while, execute block as long as false.",
    "when"	=> "Part of case conditionals.",
    "yield"	=> "Pause and transfer control to the code block."
}

incorrect_answers = {}

key_terms.each do |term, definition|
    puts definition
    input = gets.chomp
    if term != input
        puts "Incorrect. \n"
    incorrect_answers[term] = definition
    else
        puts "That's right. \n"
    end
end

print incorrect_answers

puts "Let's try the ones you got wrong again."
until incorrect_answers.empty? do
    incorrect_answers.each do |term, definition|
        puts definition
        input = gets.chomp
        if term != input
            puts "Incorrect. \n"
        else
            puts "That's right"
            incorrect_answers.delete(term)
        end
    end
end