require 'pry'

class LivingRoom
    
    def initialize(new_dictionary)
        @new_dictionary = new_dictionary
    end

    def enter
        puts "The next room looks like a living room.  The room is strewn with comfy-looking cushions in various colors. There's a chest on the floor as well."
        choice = choose_object

        #users may look at objects until they enter "nothing" or "no" at which point the loop will break
        loop do
            if choice =~ /cushions/
                puts "You peer closely at each cushion and even sit down on each one, but you don't find anything interesting."
                choice = choose_object
            elsif choice =~ /chest/
                puts "You approach the chest and open it.  Inside you find a key ring with three keys on it. Two have a label: #{@new_dictionary.foreign_word('car key')}, #{@new_dictionary.foreign_word('bike lock key')}."
                if @new_dictionary.user_dictionary.has_key?(@new_dictionary.foreign_word('key'))
                    puts "Looks like you've seen the word '#{@new_dictionary.foreign_word('key')}' before.  You recorded it as '#{@new_dictionary.user_dictionary.fetch(@new_dictionary.foreign_word('key'))}'. Does that still sound right to you?"
                    answer = gets.chomp
                    if answer =~ /n/
                        puts "What do you think it means?"
                        @new_dictionary.check_translation(gets.chomp, @new_dictionary.foreign_word('key'))
                        choice = choose_object
                    else
                        choice = choose_object
                    end
                else
                    puts "That word #{@new_dictionary.foreign_word('key')} seems to be repeated...what do you think it means?"
                    @new_dictionary.check_translation(gets.chomp, @new_dictionary.foreign_word('key'))
                    choice = choose_object
                end
            elsif choice =~ /no/
                puts "Time to move on to.  It looks like the next room is a kitchen.  Do you want to go there or go back to the entryway?"
                room_choice = gets.chomp
                until room_choice == "kitchen" || room_choice == "entryway"
                    puts "I didn't understand that. If you want to go to the kitchen, say 'kitchen'. If you want to go back to the entryway, say 'entryway'."
                    room_choice = gets.chomp
                end
                return room_choice
                break
            else
                puts "I'm not sure what that is."
                choice = choose_object
            end
        end

    end 

end
