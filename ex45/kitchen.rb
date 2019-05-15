class Kitchen
    
    def initialize(new_dictionary)
        @new_dictionary = new_dictionary
    end

    def enter
        puts "You walk into the kitchen.  It's eerily clean and empty.  You notice a drawer that's partly ajar, a jar with a smudged label on it, and an open cupboard."
        choice = what_else

        loop do
            if choice =~ /drawer/
                puts "You approach the drawer and pull on it.  It's sticky but with a sharp tug you're able to open it the rest of the way.  Inside there's a scattered array of kitchen knives, although most look dully and rusty.  You shut the drawer again and notice a label on the outside: '#{@new_dictionary.foreign_word('knife')}'. What do you think it means?"
                english_word = gets.chomp
                @new_dictionary.check_translation(english_word, @new_dictionary.foreign_word('knife'))
                choice = what_else
            elsif choice =~ /jar/
                puts "You pick up the jar.  Scattered in the dusty bottom are a few pieces of...some type of grain?  You examine the label, which reads '#{@new_dictionary.foreign_word('wheat')}'. What do you think it means?"
                english_word = gets.chomp
                @new_dictionary.check_translation(english_word, @new_dictionary.foreign_word('wheat'))
                choice = what_else
            elsif choice =~ /cupboard/
                puts "You open the cupboard and look in. It's stacked with dusty dishes.  There's a label: '#{@new_dictionary.foreign_word('plate')}'. What do you think it means?"
                english_word = gets.chomp
                @new_dictionary.check_translation(english_word, @new_dictionary.foreign_word('plate'))
                choice = what_else
            elsif choice =~ /no/
                puts "It looks like there's some kind of pantry or storage closet in the back of the kitchen.  Do you want to look at the closet or go back to the living room?"
                case room_choice = gets.chomp
                when "closet"
                    return "storage_closet"
                when "living room"
                    return "living_room"
                end
                break
            else
                puts "I don't know what you mean."
                choice = what_else
            end
        end
    end

end