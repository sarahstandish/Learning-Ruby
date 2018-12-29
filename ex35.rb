#from Ruby the Hard Way https://learnrubythehardway.org/book/ex35.html 

def gold_room
    puts "This room is full of gold. How much do you want to take?"

    print ">"
    choice = $stdin.gets.chomp

    if choice =~ /(\d+)/
        how_much = choice.to_i
    else
        dead("Man, learn to type a number.")
    end

    if how_much < 50
        puts "Nice."
        exit(0) #this will abort the program with a "good exit".  If you use exit(1) it could send an error message. this is something I could learn more about.  You can do more error messages with other numbers, exit(2) and exit(3) and so on.
    else
        dead("You greedy bastard!")
    end

end

def bear_room
    puts "There is a bear here. \n The bear has a bunch of honey. \n The fat bear is in front of another door. \n How are you going to move the bear?"
    bear_moved = false

    #this makes an infinite loop because we aren't specifying anything in particular to be true
    #the loop breaks when another method activates
    while true
        print ">"
        choice = $stdin.gets.chomp
        if choice == "Take honey."
            dead("The bear looks at you and then slaps your face off.")
        elsif choice == "taunt bear" && !bear_moved
            puts "The bear has moved from the door. You can go through now."
            bear_moved = true
        elsif choice == "taunt bear" && bear_moved
            dead("The bear gets pissed off and chews your leg off.")
        elsif choice == "open door" && bear_moved
            gold_room
        else
            puts "I got no idea what that means."            
        end
    end
end


def cthulu_room
    puts "Here you see the great evil Cthulu. \n He, it, whatever stares at you and you go insane. \n Do you flee for your life or eat your head?"
    choice = $stdin.gets.chomp

    print ">"
    if choice.downcase.include?("flee")
        start
    elsif choice.downcase.include?("head")
        dead("Well, that was tasty!")
    else
        cthulu_room
    end
end

def dead(why)
    puts why, "Good job!"
    exit(0)
end

def start
    puts "You are in a dark room. \n There is a door to your right and your left. \n Which one do you take?"

    print ">"
    choice = $stdin.gets.chomp
    if choice == "left"
        bear_room
    elsif choice == "right"
        cthulu_room
    end

end

start 