#https://learnrubythehardway.org/book/ex45.html
#directions: make a game different than the one the author made
#review it based on the Ruby Style Guide https://github.com/rubocop-hq/ruby-style-guide and try to use good style

require './what_else.rb'
require './dictionary.rb'
require './entryway.rb'
require './livingroom.rb'
require './kitchen.rb'
require './storage_closet.rb'
require './rooms.rb'


def play_game(starting_room)

    #initialize a new dictionary for the user. This is where they will store the words they learn.
    new_dictionary = Dictionary.new

    #initialize an instance of the rooms class. This is what will enable users to switch rooms.
    rooms = Rooms.new

    #start with the entryway
    room_choice = rooms.enter_room(starting_room, new_dictionary)

    #run a loop where the user enters a new room based on the value returned by the previous room
    #if the value returned is "done", the game is over
    loop do
        room_choice = rooms.enter_room(room_choice, new_dictionary)
        break if room_choice == "done"
    end

end

#play the game starting in the entryway
play_game("entryway")



