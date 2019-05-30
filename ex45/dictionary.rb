class Dictionary

    #initialize with an empty hash which will store the words the user learns
    def initialize
        @user_dictionary = {}
    end

    # a mix of Klingon and Dothraki
    @@official_dictionary = {
        "book" => "timvir",
        "snake" => "gezri",
        "welcome" => "iddelat",
        "family" => "rhojosor",
        "knife" => "mihesof",
        "plate" => "rayan",
        "key" => "ngaQHa",
        "spoon" => "baghneQ",
        "fork" => "puq",
        "car key" => "puH Duj ngaQHa",
        "bike lock key" => "baj ngaQHa",
        "wheat" => "challeya"
        }
    
    
    def official_dictionary
        @@official_dictionary
    end

    def foreign_word(english_word)
        @@official_dictionary[english_word]
    end

    def english_word(foreign_word)
        @@official_dictionary.key(foreign_word)
    end

    #check the translation provided by a user; add to user's dictionary
    def check_translation(english_word, foreign_word)

        if @@official_dictionary[english_word] == foreign_word
            @user_dictionary[foreign_word] = english_word
            puts "Yes, that sounds right."
        else 
            @user_dictionary[foreign_word] = "Maybe - #{english_word}"
            puts "Hmm, I'm not sure about that, but I'll write it down anyway."
        end

    end

    def user_dictionary
        @user_dictionary
    end

    #reveal to the user what they have in their dictionary
    def show_user_dictionary

        puts "Would you like to see what you have in your personal dictionary so far?"
        if gets.chomp =~ /y/
            #sort alphabetically
            @user_dictionary = @user_dictionary.sort_by.to_h { |foreign_word, english_word| foreign_word }
            #list all words in user dictionary
            @user_dictionary.each { |foreign_word, english_word| puts "#{foreign_word}: #{english_word}"}
        end
    end

end