#https://learnrubythehardway.org/book/ex45.html
#directions: make a game different than the one the author made

require './what_else.rb'
require './dictionary.rb'
require './entryway.rb'
require './livingroom.rb'
require './kitchen.rb'
require './storage_closet.rb'
require './rooms.rb'


def play_game(starting_room)

    new_dictionary = Dictionary.new

    rooms = Rooms.new

    room_choice = rooms.enter_room(starting_room, new_dictionary)
    loop do
        room_choice = rooms.enter_room(room_choice, new_dictionary)
        break if room_choice == "done"
    end

end

play_game("entryway")


# entryway = Entryway.new(new_dictionary)
# entryway.enter
# living_room = LivingRoom.new(new_dictionary)
# living_room.enter
# kitchen = Kitchen.new(new_dictionary)
# kitchen.enter
# storage_closet = StorageCloset.new(new_dictionary)
# storage_closet.enter

