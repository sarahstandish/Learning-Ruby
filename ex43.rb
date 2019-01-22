#exercise 43 from Ruby the Hard Way
#https://learnrubythehardway.org/book/ex43.html

class Scene

    def enter
        puts "You have entered the room. But which room?"
    end
end

class Death < Scene

    def enter
        puts "Oops, you're dead!"
        exit(0)
    end
end

class CentralCorridor < Scene

    def enter
        puts "You are in the central corridor. A Gothon is standing there.  The Gothon says to you, 'I'll let you by if you can solve my riddle. What do you call bears with no ears?'"
        answer = gets.chomp
        case answer
        when /b/i
            puts "That's right! Go on to the Laser Weapon Armory!"
            @next_scene = @central_corridor
            sarah.next_scene
        else
            puts "Nope! The Gothon decides to eat you."
            @next_scene = @death
        end
    end
end

class LaserWeaponArmory < Scene

    def enter
        puts "You enter the Laser Weapon Armory. You see a neutron bomb. Perfect! You can use this to blow up the ship before getting into the escape pod. You approach and see a keypad with the numbers 1 through 5 on it.  You try to remember which number you need to press...you're sure there's only one...what it is?  Holding your breath, you press the number..."
        number = gets.chomp
        if number == 3
            puts "That was it! You grab the bomb and throw it in your bag. Next you head to the bridge."
            TheBridge.enter
        elsif number > 5 || number < 1
            puts "Are you drunk? That's not on the keypad. Well, too late. Aliens see you and fire their weapons."
            Death.enter
        else
            puts "No! That wasn't it! The bomb explodes."
            Death.enter
        end
    end
end

class TheBridge < Scene
    
    def enter
        puts "You enter the bridge. You must place the bomb here in order to blow up the aliens after you leave the ship. But oh no! An alien is approaching. You raise your laser gun and aim it at him. Which body part do you aim for?"
        aim = gets.chomp
        case aim
        when /head/
            puts "His helmet deflects your laser beam back onto you and you die."
            Death.enter
        when /foot/i || /leg/i || /knee/i || /ankle/i || /thigh/i
            puts "You found its weakness! It collapses. You run to the escape pods."
            EscapePod.enter
        else
            puts "You wound the alien, but not mortally. It raises its weapon and fires back and you and you die."
            Death.enter
        end
    end
end

class EscapePod < Scene

    def enter
        puts "You approach the escape pods and you see that there are two remaining. The problem is, you're pretty sure you saw an alien run this way earlier--he must be hiding in one of the escape pods. Which one do you escape in, the one on the left or the one on the right?"
        case choice
        when /left/i
            puts "It's empty! Whew. You fly away and detonate the bomb remotely once you've cleared the area. Success!"
        else
            puts "Oh no! There's an alient! Lightning-fast, it raises its laser weapon and shoots you."
            Death.enter
        end
    end
end

class Player

    def initialize
        @next_scene = nil
    end
    
    attr_accessor :next_scene

    def central_corridor
        @central_corridor = CentralCorridor.new
        @central_corridor.enter
    end

    def laser_weapon_armory
        @laser_weapon_armory = LaserWeaponArmory.new
        @laser_weapon_armory.enter
    end

    def the_bridge
        @the_bridge = TheBridge.new
        @the_bridge.enter
    end

    def escape_pod
        @escape_pod = EscapePod.new
        @escape_pod.enter
    end

    def death 
        @death = Death.new 
        death.enter
    end

    def play
        puts "You are a brave space explorer, but your ship has been invaded by aliens!"
        @next_scene = central_corridor
    end

end

# class Map 

#     def initialize(start_scene)
#         @start_scene = start_scene
#     end

#     attr_accessor :start_scene

#     def next_scene(player_status)
#     end



#     def opening_scene
#     end

# end

sarah = Player.new
sarah.play

