#ruby the hard way #44
#https://learnrubythehardway.org/book/ex44.html

#inheritance

class Parent 

    def initialize(name)
        @name = name
    end

    # there are actions that happen when you define a function in the parent but not in the child
    def implicit 
        puts "PARENT implicit"
    end

    def override 
        puts "PARENT override"
    end

    def altered
        puts "PARENT altered"
    end

end

# class Child < Parent 

#     def initialize(age, name)
#         @age = age
#         super(name)
#         #usually the only reason to use super is in an initialize function, that's when you'd when the class to do some of it's own stuff and then bounce back to the parent class
#     end

#     #you can override a parent class simply by naming a child class with the same name
#     def override 
#         puts "CHILD override"
#     end

#     #you can also use the super function when you override a function but then make it call the parent version before swinging back to the child version 
#     def altered 
#         puts "CHILD, before parent altered." #CHILD, before parent altered
#         super 
#         puts "CHILD, after parent altered." #PARENT altered, CHILD, after parent altered.
#     end

# end

# dad = Parent.new("Myles")
# son = Child.new(28, "Duncan")

#composition

# class Other

#     def override 
#         puts "Other override"
#     end

#     def implicit
#         puts "Other implicit"
#     end

#     def altered
#         puts "other altered"
#     end

# end

# class Child 

#     def initialize
#         @other = Other.new
#     end

#     def override
#         puts "child override"
#     end

#     def implicit
#         @other.implicit 
#     end

#     def altered
#         puts "Child override"
#         @other.altered
#         puts "Child, after other altered"
#     end
# end

#this is similar to the inheritance, but this isn't an intheritance (is-a) relationship, this is a (has-a) relationship

# modules

#another way we could do this would be to define a module and a concept called mixins.  You can create a module with functions that are common to classes and then include them in your classes.  Mixins won't be covered in Ruby the Hard Way.  They are an advanced topic.

module Other 

    def override
        puts "Other override"
    end

    def implicit
        puts "other implicit"
    end

    def Other.altered 
        puts "other altered"
    end

end

class Child 
    include Other

    def override 
        puts "Child override"
    end

    def altered
        puts "Child, before other altered"
        Other.altered
        puts "Child, after other altered."
    end
end

son = Child.new 

son.implicit 
son.override 
son.altered 

#read the Ruby Style Guide https://github.com/rubocop-hq/ruby-style-guide

#got to about here https://github.com/rubocop-hq/ruby-style-guide#no-and-or-or