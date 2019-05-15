class StorageCloset

    def initialize(new_dictionary)
        @new_dictionary = new_dictionary
    end

    def enter
        puts "You walk through the door.  Looking around, you see stacks and stacks of boxes.  Sure looks like a storage closet. Boxes on the shelves, boxes on the floor....and there's something moving!  A large rat runs out of the back, heading straight for the open door behind you.  You leap to the side to avoid it, slip, and send boxes crashing off one of the shelves. As you fall, you let go of the door and it swings shut.  Rising, you grab the handle, but it's locked.  Taking deep breaths, you look around you. There's a window on the back wall, but it appears to be sealed shut.  In the dim light, you can see that many of the boxes are labeled: #{@new_dictionary.foreign_word('book')}, #{@new_dictionary.foreign_word('snake')}, #{@new_dictionary.foreign_word('knife')}, #{@new_dictionary.foreign_word('plate')}, #{@new_dictionary.foreign_word('key')}, #{@new_dictionary.foreign_word('spoon')}, #{@new_dictionary.foreign_word('fork')}.  Maybe there's something that could help you in one of these boxes."
        @new_dictionary.show_user_dictionary
        
        loop do
        puts "Which box you would like to open?"
        
        choice = gets.chomp

            if !@new_dictionary.official_dictionary.values.include? choice
                puts "That's not one of the boxes.  What box do you want to open?"
                choice = gets.chomp
            end
            if choice == @new_dictionary.foreign_word('key')
                puts "You open the box labeled #{@new_dictionary.foreign_word('key')}. There's a key inside.  You insert it into the door--it fits! You open it and decide to leave the house as quickly as you can."
                return "done"
                break
            elsif choice == @new_dictionary.foreign_word('knife')
                puts "You open the box labeled #{@new_dictionary.foreign_word('knife')}. There's a thin knife inside.  You walk to the window at the bag of the room and run the knife around the end. Slowly, through painstaking work, you're able to cut away enough gunk to open the window. You shimmy out, drop into the back yard, and decide to get out of there."
                return "done"
                break
            else
                puts "You open the box labeled #{choice}. Inside there's a #{@new_dictionary.english_word(choice)}. Not very useful."
            end
        end
    end

end