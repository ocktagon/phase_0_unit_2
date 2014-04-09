# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: number of sides 
# Output: 
  # number of sides for method sides
  # random number with sides as max for method roll
# Steps:
  # Create class called Die
  #   Take number of sides as Input
  #   UNLESS number of sides >= 1, throw argument ArgumentError
  #   ELSE initialize sides
  #   END LOOP
  # METHOD: sides
  # return number of sides 
  # METHOD: roll
  # return random range between 1 and @sides




# 3. Initial Solution

# class Die
#   def initialize(sides)
#   	unless sides >= 1
#     	raise ArgumentError.new("Only positive numbers allowed!")
#     else
#       @sides = sides
#     end
#   end
#   def sides
#     	return @sides
#   end

#   def roll
#     prng = Random.new
#     return prng.rand(1..@sides)
#   end
# end



# 4. Refactored Solution
class Die
  def initialize(sides)
    	raise ArgumentError.new("Only positive numbers allowed!") if sides < 1
    	@sides = sides
  end
  def sides
    	return @sides
  end

  def roll
    return rand(1..@sides)
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
puts "Class called Die defined?" 
puts Object.const_defined?('Die')
puts "Method called sides defined?" 
puts Die.instance_methods(false).include?(:sides)
puts "Method called roll defined?"
puts Die.instance_methods(false).include?(:roll)
puts "Side method returns 6 for die with 6 sides?"
puts Die.new(6).sides == 6
puts "Roll method returns 1..6 for die with 6 sides?"
puts Die.new(6).roll.between?(1,6)


# # 5. Reflection 
# Given the simplicity of what needed to be solved, it was really hard to do driver tests first.  
# I don't think I did this the right way in that I thought of new driver tests as I was coding and added them,
# which I think defeats the purpose of test first development.  I'm hoping to be able to do this better
# as we get into more complicated code.  As a result of thinking about new tests, I think I came up
# with a pretty cool set of tests that check for whether the class and methods were defined, and 
# true checks using the test variable of 6. 

# As for the code itself, I had an interesting situation where if I used the Random.new method the
# code took awfully long.  Rather than go this route, I just used rand as-is.  
# I also think the refactored solution did a good job in eliminating the extraneous conditional 
# statements by putting the raise error directions on the same line as an if statement, otherwise
# just initiate.  This made my code very simple and easy to read.   
