# From "Learn Ruby the Hard Way" https://learnrubythehardway.org/book/ex37.html

# the purpose of this program is to practice various keywords introduced 
# in exercise 37 of Ruby the Hard Way
# and in previous exercises

class Student
    def initialize(name, detention_status, house)
        @name = name
        @detention_status = detention_status
        @house = house
    end

    def get_player_name #read the attribute
        @name
    end

    def change_detention_status=(detention_status) #using this method we can change the attribute
        @detention_status = detention_status
    end

    def get_detention_status #read the attribute
        @detention_status
    end

    def set_house=(house)
        @house = house
    end

    def get_house
        @house
    end

    alias name get_player_name #practice using alias
end

def get_player_name
    puts "You are standing in the entryway to the  school with the rest of the new students. Professor McGonagal approaches and asks you, \"What's your name?\""
    name = gets.chomp.capitalize
    return name
end


def choose_to_go_in(player)
    puts "\n\n\"Welcome, #{player.get_player_name},\" Professort McGonagal greets you."
    
    puts "\n\nThe Great Hall is in front of you.  Do you go in?"
    choice = gets.chomp
    
    until choice =~ /y/i || choice =~ /n/i  #until includes the letter y or n in lower or upper case 
        puts "Huh?"
        choice = gets.chomp
    end

    case choice 
    when /y/i #matches the character y in any case
        puts "\n\nYou enter the Great Hall."
    when /n/i #matches the character n in any case
        puts "\n\nProfessor McGonagal catches you walking away from the Great Hall. She makes you go in anyway, but gives you detention to be served after the sorting ceremony."
        player.change_detention_status = true
    end
    
end

def great_hall(player)
    puts "\n\nIn the Great Hall, you line up with the other first years at the back."

    if player.get_detention_status == true
        puts "\n\nAnother first-year whispers to you: \"Wow, I can't believe you already got detention!\""
    elsif player.get_detention_status == false
        puts "\n\nAnother first-year whispers to you: \"Did you hear that Billingsly didn't come into the Great Hall right away and he already got detention?\'"
    end

    puts "\n\nOne by one, Professor McGonagal calls students to the front of the Great Hall to be sorted. Finally, you hear your name echoing from the stone walls:\n\n\"#{player.get_player_name.upcase}!\"\n\nIt's time.  You approach the sorting hat and place it on your head."

end

def sorting_hat(player)

    houses = ["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]

    print "\n\nYou hear a low voice, almost muttering to itself...\n\n\"Well, #{player.get_player_name}\" it says...  "

    case player.get_detention_status
    when true
        puts "\"Detention already...my, my...you have been busy...it seems you would be a good fit for Gryffindor, or perhaps Slytherin...the brave and the ambitious must be ready to break the rules. Don't you agree?\""
        agree = gets.chomp
        case agree
        when /y/i
            houses.delete("Hufflepuff")
            houses.delete("Ravenclaw")
        when /n/i
            houses.delete("Gryffindor")
            houses.delete("Slytherin")
        end
    when false
        puts "\"I see that you've avoided getting in trouble so far...unlike some...perhaps you belong in Ravenclaw or Hufflepuff...the clever and hardworking tend to thrive within the rules. Don't you agree?\""
        agree = gets.chomp
        case agree
        when /n/i
            houses.delete("Hufflepuff")
            houses.delete("Ravenclaw")
        when /y/i
            houses.delete("Gryffindor")
            houses.delete("Slytherin")
        end
    end

    print "\"So which house are you hoping for? \" the hat asks. \""
    houses.each do |house|
        print house
        print "...? "
    end

    puts "\""

    hope = gets.chomp

    unless hope =~ /Gryffindor/i || hope =~ /Slytherin/i || hope =~ /Ravenclaw/i || hope =~ /Hufflepuff/i
        puts "Hmmm, that's not one of the houses."
        hope = gets.chomp.capitalize
    end

    if houses.include?(hope)
        player.set_house = hope
        puts "\n\n\"An easy case, then...better be #{player.get_house.upcase}!!!!\""
    else
        player.set_house = houses[rand(1)]
        puts "\n\n\"Not sure I agree...I'm placing you in...#{player.get_house.upcase}!!!!\""
    end

    puts " The hat shouted the last word out loud. As the students in the great hall clap and cheer politely, you walk to the #{player.get_house} table and sit down."

end

BEGIN { puts "Welcome to Hogwarts School of Witchcraft and Wizardry!"}

player = Student.new(get_player_name, false, nil)

choose_to_go_in(player)

great_hall(player)

sorting_hat(player)

END { puts "\n\nThanks for visiting Hogwarts!" }