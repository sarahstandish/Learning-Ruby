# From "Learn Ruby the Hard Way" https://learnrubythehardway.org/book/ex37.html

# the purpose of this program is to practice various keywords introduced 
# in exercise 37 of Ruby the Hard Way
# and in previous exercises

class Student
    def initialize(name)
        @name = name
        @detention_status = false
        @house = nil
    end

    attr_reader :name
    attr_accessor :detention_status
    attr_accessor :house



end

def get_player_name
    puts "You are standing in the entryway to the  school with the rest of the new students. Professor McGonagal approaches and asks you, \"What's your name?\""
    name = gets.chomp.capitalize
    return name
end


def choose_to_go_in(player)
    puts "\n\n\"Welcome, #{player.name},\" Professort McGonagal greets you."
    
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
        player.detention_status = true
    end
    
end

def great_hall(player)
    puts "\n\nIn the Great Hall, you line up with the other first years at the back."

    if player.detention_status == true
        puts "\n\nAnother first-year whispers to you: \"Wow, I can't believe you already got detention!\""
    elsif player.detention_status == false
        puts "\n\nAnother first-year whispers to you: \"Did you hear that Billingsly didn't come into the Great Hall right away and he already got detention?\'"
    end

    puts "\n\nOne by one, Professor McGonagal calls students to the front of the Great Hall to be sorted. Finally, you hear your name echoing from the stone walls:\n\n\"#{player.name.upcase}!\"\n\nIt's time.  You approach the sorting hat and place it on your head."

end

def sorting_hat(player)

    houses = ["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]

    print "\n\nYou hear a low voice, almost muttering to itself...\n\n\"Well, #{player.name}\" it says...  "

    case player.detention_status
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
        player.house = hope
        puts "\n\n\"An easy case, then...better be #{player.house.upcase}!!!!\""
    else
        player.house = houses[rand(1)]
        puts "\n\n\"Not sure I agree...I'm placing you in...#{player.house.upcase}!!!!\""
    end

    puts " The hat shouted the last word out loud. As the students in the great hall clap and cheer politely, you walk to the #{player.house} table and sit down."

end

def new_friend

    possible_friends = ["Thu", "Ahmed", "Selina", "Wilhelmina"]

    puts "You look around and notice some students you recognize from the Hogwards Express sitting around you: #{possible_friends.join(", ")} ...which do you talk with?\""
    friend = gets.chomp
    unless possible_friends.include?(friend.capitalize)
        puts "That person isn't at your table."
        friend = gets.chomp
    end
    return friend.capitalize
end

def meet_friend(friend)
    puts "#{friend.name} turns to you and says, \"Hi, I'm #{friend.name}. I'm in #{friend.house} too.\""
end

BEGIN { puts "Welcome to Hogwarts School of Witchcraft and Wizardry!"}

player = Student.new(get_player_name)

choose_to_go_in(player)

great_hall(player)

sorting_hat(player)

friend = Student.new(new_friend)
friend.house = player.house

meet_friend(friend)

END { puts "\n\nThanks for visiting Hogwarts!" }