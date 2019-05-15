class LivingRoom
    
    def initialize(new_dictionary)
        @new_dictionary = new_dictionary
    end

    def enter

        puts "The next room looks like a living room.  The room is strewn with comfy-looking cushions in various colors. There's a chest on the floor as well."
        choice = what_else
        loop do
            if choice =~ /cushions/
                puts "You peer closely at each cushion and even sit down on each one, but you don't find anything interesting."
                choice = what_else
            elsif choice =~ /chest/
                puts "You approach the chest and open it.  Inside you find a key ring with three keys on it. Two have a label: #{@new_dictionary.foreign_word('car key')}, #{@new_dictionary.foreign_word('bike lock key')}."
                #binding.pry
                if @new_dictionary.check_user_dictionary.has_key?(@new_dictionary.foreign_word('key'))
                    puts "Looks like you've seen the word '#{@new_dictionary.foreign_word('key')}' before.  You recorded it as '#{@new_dictionary.check_user_dictionary.fetch(@new_dictionary.foreign_word('key'))}'. Does that still sound right to you?"
                    answer = gets.chomp
                    if answer =~ /n/
                        puts "What do you think it means?"
                        english_word = gets.chomp
                        @new_dictionary.check_translation(english_word, @new_dictionary.foreign_word('key'))
                        choice = what_else
                    else
                        choice = what_else
                    end
                else
                    puts "That word #{@new_dictionary.foreign_word('key')} seems to be repeated...what do you think it means?"
                    english_word = gets.chomp
                    @new_dictionary.check_translation(english_word, @new_dictionary.foreign_word('key'))
                    choice = what_else
                end
            elsif choice =~ /no/
                puts "Time to move on to.  It looks like the next room is a kitchen.  Do you want to go there or go back to the entryway?"
                case room_choice = gets.chomp
                when "kitchen"
                    return "kitchen"
                when "entryway"
                    return "entryway"
                end
                break
            else
                puts "I'm not sure what that is."
                choice = what_else
            end
        end

    end 

end
