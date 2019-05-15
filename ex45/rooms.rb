class Rooms

    def initialize

    end

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