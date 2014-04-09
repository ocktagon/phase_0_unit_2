# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: labels (group of mixed values)
# Output: Sides - number of sides, Roll - the value rolled
# Steps:
  # Create class called Die
  #   Take array as Input
  #   IF labels.empty?, raise ArgumentError 
  #   ELSE initialize sides
  #   END LOOP
  # METHOD: sides
  # return array.length (sides) 
  # METHOD: roll
  # return random sampling of array


# 3. Initial Solution

# class Die
#   def initialize(labels)
#     raise ArgumentError.new("Array is empty!") if labels.empty?
#   	@labels = labels
#   end

#   def sides
#   	return @labels.length
#   end

#   def roll
#   	if @labels.length == 1
#   	  return @labels.first
#   	else
#   		return @labels.shuffle.sample
#   	end
#   end
# end



# 4. Refactored Solution


class Die
  def initialize(labels)
    raise ArgumentError.new("Array is empty!") if labels.empty?
  	@labels = labels
  end

  def sides
  	return @labels.length
  end

  def roll
  	return @labels.first unless @labels.length > 1
    return @labels.shuffle.sample
  end

end



# 1. DRIVER TESTS GO BELOW THIS LINE
puts "Class called Die defined?" 
puts Object.const_defined?('Die')
puts "Method called sides defined?" 
puts Die.instance_methods(false).include?(:sides)
puts "Method called roll defined?"
puts Die.instance_methods(false).include?(:roll)
puts Die.new(["A","B","C","D","E"]).sides == 5
puts "Side method returns count of array"
puts Die.new(["A","B","C","D","E"]).sides == 5
puts "Roll method returns one element if only one input"
puts Die.new(["A"]).roll == ("A")
# Couldn't get this test to work...
# puts "Roll method returns any one of 5 elements passed"
# puts Die.new(["A","B","C","D","E"]).roll == ("A") || ("B") || ("C") || ("D") || ("E")


# 5. Reflection 
# I'm finding that the best way to simplify 4-5 lines of conditionals
# is to use the one-liner ifs and unless statements.  The Refactored
# code does just that and keeps all the methods shorter than 2 lines.

# For the driver tests, validating the sides method was easy since
# it was basically seeing if the input.length matches the output, 
# but I had trouble creating any meaningful test where the array output 
# could be any value within the input (and I don't think this can be defined by setting a range).
