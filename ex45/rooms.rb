# a class of rooms which contains a hash which stores the name of each room as the key and initializes each room as the value

class Rooms

    def initialize; end

    #to enter the room, know the scene that you'll enter and pass the user's dictionary in
    def enter_room(scene, new_dictionary)
        
        @@rooms = {
            "entryway" => Entryway.new(new_dictionary),
            "living_room" => LivingRoom.new(new_dictionary),
            "kitchen" => Kitchen.new(new_dictionary),
            "storage_closet" => StorageCloset.new(new_dictionary)
        }
        
        @@rooms[scene].enter

    end

end