#the first room in the house
class Entryway

    #initialize with a new dictionary, aka the user's personal dictionary
    def initialize(new_dictionary)
        @new_dictionary = new_dictionary
    end

    def enter
        puts "You step into the entryway and breath in the cool, stale air.  You look around you and see a mat on the ground in front of the doorway, a photograph and a hook on the wall, and an umbrella stand."
        #prompt the user to choose an object to look at and return the result of that choice
        choice = choose_object
        #keep asking the user what they want to look at until the choice is "no" or "nothing"
        loop do
            if choice =~ /photograph/
                puts "It's a photograph of a smiling man and a little girl. You look closer.  There's a word written underneath: #{@new_dictionary.foreign_word('family')}. What do you think it means?"
                @new_dictionary.check_translation(gets.chomp, @new_dictionary.foreign_word('family'))
                choice = choose_object
            elsif choice =~ /umbrella/
                puts "There are no umbrellas in it."
                choice = choose_object
            elsif choice =~ /mat/
                puts "You look more closely at the mat. There's a word written there: #{@new_dictionary.foreign_word('welcome')}. What do you think it means?"
                @new_dictionary.check_translation(gets.chomp, @new_dictionary.foreign_word('welcome'))
                choice = choose_object
            elsif choice =~ /hook/
                puts "You peer closely at the hook--there is something written there: #{@new_dictionary.foreign_word('key')}. What do you think it means?"
                @new_dictionary.check_translation(gets.chomp, @new_dictionary.foreign_word('key'))
                choice = choose_object
            elsif choice =~ /no/
                puts "You walk through the doorway into the next room."
                return "living_room"
                break
            else
                puts "I'm not sure what that is."
                choice = choose_object
            end
        end

    end

end