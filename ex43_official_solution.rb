#this is the offical solution to exercise 43 from Ruby the Hard Way
#putting it here to study it since I wasn't able to solve it on my own
# https://learnrubythehardway.org/book/ex43.html

#goal: understand how he uses classes and sub-classes
#comment on everything so I can be sure I understand it

class Engine #make a class called engine. this runs the game

    def initialize(scene_map) #initialize the enginge with a local variable called scene map
        @scene_map = scene_map #assign the local variable scene_map to an instance variable also called scene_map
    end

    def play #defines a method called play. When we call .play on an engine instance, it will start the game
        current_scene = @scene_map.opening_scene #this defines a local variable called 'current scene' by calling a function that is defined later, in the scene map class.  In the Map class, .opening_scene is defined as return next_scene(@start_scene).  next_scene is another method from the Map class.  It will pull a scene from the @@scenes hash and enter it.
        last_scene = @scene_map.next_scene('finished') #defines a local variable called 'last scene' and sets it as equal to the value of 'finished' in the @@scenes hash, which is Finished.new. So there is a scene which is called Finished and here we're letting the computer know that it is the last scene

        while current_scene != last_scene
            next_scene_name = current_scene.enter
            current_scene = @scene_map.next_scene(next_scene_name)
        end

        current_scene.enter #enter the room
    end
end

class Scene 
    def enter
        puts "Needs a subclass" #this is just filler to let you know if you haven't classified one of the scenes correctly
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


class CentralCorridor < Scene

    def enter
        puts "The Gothons of Planet Percan #25 have invaded your ship and destroyed your entire crew. Y ou are the last surviving member and your last mission is to get the neutron destruct bomb from the Weapons Armory, put it in the bridge, and blow the ship up after getting into an escap pod. \n\n You're running down the central corridor to the Weapons Armory when a Gothon jumps out. He has red scaly skin, dark grimy teeth, and an evil clown clostume flowing around his hate filled body. He's blocking the door to the Armory and about to pull a weapon to blast you. What do you do? >"

        action = $stdin.gets.chomp

        if action == "shoot"
            puts "Quick on the draw, you yank our your blaster and fire it at the Gothon. His clown costume is flowing and moving around his body, which throws off your aim. Your laser hits his costume but misses him entirely. This completely ruins his brand new costume his mother bought him, which makes him fly into an insane rage and blast you repeatedly in the face until you are dead. Then he eats you."
            return 'death'

        elsif action == "dodge"
            puts "Like a world class boxer you dodge, weave, slip, and slide right as the Gothon's blaster cranks a laser past your head. In the middle of your artful dodge, your foot slips and you bang your head on the metal wall and pass out. You wake up shortly after only to die as the Gothon stomps on your head and eats you."
            return 'death'

        elsif action == "tell a joke"
            puts "Lucky for you they made you learn Gothon insults in the academy. You tell the one Gothon joke you know: alkdjfaldkjfadlskjf. The Gothon stops and bursts out laughing and can't move. While he's laughing you run up and shoot him square in the head, then jump through the Weapon Armory door."
            return 'laser_weapon_armory'

        else
            puts "Does not compute. You can shoot, dodge, or tell a joke."
            return 'central_corridor'
        end
    end
end

class LaserWeaponArmory < Scene 
     
    def enter
        puts "You do a dive roll into the Weapon Armory, crouch and scan the room for more Gothons that might be hiding. It's dead quiet, too quiet. You stand up and run to the far side of the room and find the neutron bomb in its container. There's a keypad lock on the box and you need the code to get the bomb out. If you get the code wrong 10 times then the lock cloese forever and you can't get the bomb. The code is three digits."
        code = "123" # this was originally randomly generated but I won't be able to test the game if I can't guess the code
        guess = $stdin.gets.chomp
        print "[keypad]>"
        guesses = 0

        while guess != code && guesses < 10
            puts "BZZZZD!"
            guesses += 1
            print "[keypad]>"
            guess = $stdin.gets.chomp
        end

        if guess == code
            puts "The container clicks opena nd the seal breaks, letting gas out. You grab the neutron bomb and run as fast as you can to the bridge where you must place it on the right spot."
            return 'the_bridge'
        else
            puts "The lock buzzes one last time and then you hear a sickening melting sound as the mechanism is fused together. You decide to sit there, and finally the Gothonms blow up the ship from their ship and you die."
            return 'death'
        end
    end
end

class TheBridge < Scene

    def enter
        puts "You burst onto the Bridge with the neutron destruct bomb under your arm and surprise 5 Gothons who are trying to take control of the ship. Each of them has an even uglier clown costume than the last. They haven't pulled their weapons out yet, as they see the active bomb under your arm and don't want to set it off. \n What do you do? \n >"
        action = $stdin.gets.chomp

        if action == "throw the bomb"
            puts "In a panic you throw the bomb at the group of Gothons and make a leap for the door. Right as you drop it a Gothon shoots you right in the back killing you. As you die you see another Gothon frantically trying to disarm the bomb. You die knowing they will probably blow up when it goes off."
            return 'death'

        elsif action == "slowly place the bomb"
            puts "You point your blaster at the bomb under your arm and the Gothons put their hands up and start to sweat. You inch backward to the door, open it, and then carefully place the bomb on teh floor, pointing your blaster at it. You then jump back through the door, punch the close button, and blast the lock so the Gothons can't get out. Now that the bomb is placed you run to the escape pod to get off this tin can."
            return 'escape_pod'
        else
            puts "Does not compute. You can throw the bomb or slowly place the bomb."
            return 'the_bridge'
        end
    end
end

class EscapePod < Scene
    
    def enter
        puts "You rush through the ship desperately trying to make it to the escape pod before the whole ship explodes. It seems like hardly any Gothons are on the ship, so your run is clear of interference. You get to the chamber with the escape pods and now need to pick one to take. Some of them could be damaged but you don't have time to look. There are five pods. Which one do you take?"

        good_pod = "3" #again changing this so it's not random so as to be able to test the game
        print "[pod #]>"
        guess = $stdin.gets.chomp

        if guess != good_pod
            puts "You jump into pod %s and hit the eject button." % guess
            puts "The pod escapes out into the void of space, then implodes as the hull ruptures, crushing your body."
            return 'death'
        else
            puts "You jump into pod %s and hit the eject button." % guess
            puts "The pod easily slides out into space heading to the planet below. As it flies to the planet, you look back and see your ship implode then explode like a bright star, taking out the Gothon ship at the same time. You won!"
            return 'finished'
        end
    end
end

class Finished < Scene

    def enter
        puts "You won! Good job."
    end
end

class Map 
    #map comes after the scenes so they have to exist already
    @@scenes = {
        'central_corridor' => CentralCorridor.new,
        'laser_weapon_armory' => LaserWeaponArmory.new,
        'the_bridge' => TheBridge.new,
        'escape_pod' => EscapePod.new,
        'death' => Death.new,
        'finished' => Finished.new
    }

    def initialize(start_scene)
        @start_scene = start_scene
    end

    def next_scene(scene_name)
        val = @@scenes[scene_name]
        return val
    end

    def opening_scene
        return next_scene(@start_scene)
    end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play