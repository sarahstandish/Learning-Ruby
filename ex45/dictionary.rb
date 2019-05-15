class Dictionary

    def initialize

        @user_dictionary = {}

    end

    # from https://docs.dothraki.org/Dothraki.pdf or http://klingonska.org/
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
       # binding.pry
        @@official_dictionary
    end

    def foreign_word(english_word)
        return @@official_dictionary[english_word]
    end

    def english_word(foreign_word)
        return @@official_dictionary.key(foreign_word)
    end

    def check_translation(english_word, foreign_word)

        if @@official_dictionary[english_word] == foreign_word
            #binding.pry
            @user_dictionary[foreign_word] = english_word
            puts "Yes, that sounds right."
        else 
            #binding.pry
            @user_dictionary[foreign_word] = "Maybe - #{english_word}"
            puts "Hmm, I'm not sure about that, but I'll write it down anyway."
        end

    end

    def check_user_dictionary
   
        @user_dictionary

    end


    def show_user_dictionary

        puts "Would you like to see what you have in your personal dictionary so far?"
                answer = gets.chomp
        if answer =~ /y/
            @user_dictionary = @user_dictionary.sort_by.to_h { |foreign_word, english_word| foreign_word }

            @user_dictionary.each { |foreign_word, english_word| puts "#{foreign_word}: #{english_word}"}
        end
    end

end