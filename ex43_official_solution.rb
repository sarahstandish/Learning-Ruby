#this is the offical solution to exercise 43 from Ruby the Hard Way
#putting it here to study it since I wasn't able to solve it on my own
# https://learnrubythehardway.org/book/ex43.html

class Engine

    def initialize(scene_map) #start the engine with a scene map
        @scene_map = scene_map #make the attribute readable
    end

    def play
        current_scene = @scene_map.opening_scene #define how to move through the game based on a current scene and a last scene
        last_scene = @scene_map.next_scene('finished')

        #as long as the current scene and the next scene are not the same (?)
        while current_scene != last_scene
            #move through to the next scene
            #don't totally understand why this is necessary
            next_scene_name = current_scene.enter
            current_scene = @scene_map.next_scene(next_scene_name)
        end

        current_scene.enter #enter the room
    end
end

class Scene 
    def enter
        puts "Needs a subclass"
    end
end

class Death < Scene

    @@quips = [
        "You died. You kinda suck at this.",
        "Your mom would be proud...if she were smarter.",
        "Such a luser.",
        "I have a small puppy that's better at this."
    ]

    def enter
        puts @@quips[rand(0..(@@quips.length - 1))]
        exit(1)
    end
end



