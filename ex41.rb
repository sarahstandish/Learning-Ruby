#exercise 41 from ruby the hard way
# https://learnrubythehardway.org/book/ex42.html

## Pet is-a object look at the extra credit
class Pet

    def unhappy
        puts "This pet is unhappy"
    end
end

## Dog is-a Pet
class Dog < Pet

    def initialize(name)
        ## A dog has-a name
        @name = name
    end

    attr_reader :name

    def make_noise
        puts "#{@name} says 'woof woof!'"
    end
end

## A cat is-a Pet
class Cat < Pet

    def initialize(name)
        ## A cat has-a name
        @name = name
    end

    attr_reader :name

    def make_noise
        puts "#{@name} says 'meow!'"
    end

end

#there is a class called Person
class Person

    def initialize(name)
        ## a person has-a name
        @name = name
    
        ## Person has-a pet of some kind (but can be initialized without one)
        @pet = nil
    end

    attr_accessor :name
    attr_accessor :pet
    #combines the attribute reader (getter) and writer (setter) into one method

    def love_pet
        puts "#{@name} loves their pet #{pet.name} so much."
    end

end

## an employee is-a Person
class Employee < Person
    
    def initialize(name, salary)
        ##take the name attribute from the Person class
        super(name)
        ## the person has-a salary
        @salary = salary
    end

end



class Fish < Pet

    def swimming_motion
        puts "Wiggles fins."
    end
end

class Salmon < Fish
end

class Halibut < Fish
end

## Rover is-a Dog
rover = Dog.new("Rover")

## Satan is-a cat
satan = Cat.new("Satan")

## Mary is-a person
mary = Person.new("Mary")

## Mary has-a pet set to Satan
mary.pet = satan

##Frank is-a employee and has the attributes of a name and a salary
frank = Employee.new("Frank", 120000)

##Frank has-a pet set to Rover
frank.pet = rover

##flipper is-a instance of fish
flipper = Fish.new

##crouse is-a instance of salmon
crouse = Salmon.new

## Harry is-a instance of Halibut
harry = Halibut.new

frank.love_pet
mary.love_pet
satan.make_noise
rover.make_noise
flipper.unhappy