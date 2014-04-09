# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: answer, guess
# Output: Symbol or true/false
# Steps:
# CLASS GuessingGame 
# INITIALIZE with INPUT answer
# METHOD guess(guess)
#   create new variable  called stored_value
#   return symbol ':high' if guess is larger than answer
#   :correct if guess == answer, and store in variable
#   :low if guess < answer

# END
# METHOD solved?
#   return true if stored value is changed
#   return false if stored value is unchanged
# END



# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#   	@answer = answer
#   	@guess = nil
#   end
#   def guess(guess)
#   	@guess = guess
#   	if @guess > @answer
#   		return :high
#   	elsif @guess < @answer
#   	  return :low
#   	else
#   	  return :correct 
#   	end
#   end
#   def solved?
#   	if @guess == @answer
#   		return true
#   	else
#   		return false
#   	end
#   end
# end




# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
  	@answer = answer
  	@guess = nil
  end
  def guess(guess)
  	@guess = guess
  	if @guess > @answer
  		return :high
  	elsif @guess < @answer
  	  return :low
  	else
  	  return :correct 
  	end
  end
  def solved?
  	return false unless @guess == @answer
  	return true
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
puts "Method called guess defined?" 
puts GuessingGame.instance_methods(false).include?(:guess)
puts "Method called solved? defined?"
puts GuessingGame.instance_methods(false).include?(:solved?)
puts "High Test"
puts GuessingGame.new(10).guess(100) == :high
puts "Low Test"
puts GuessingGame.new(10).guess(0) == :low
puts "Correct Test"
puts GuessingGame.new(10).guess(10) == :correct


# 5. Reflection 
# In this one, my pseudo code ended up a bit different from the actual
# since I discovered the need to set up an instance variable for 
# @guess while coding so solved? would understand if the guess
# was provided or not.  I think this was the simplest way to solve 
# the problem, although i initially struggled by trying to use a stored_value variable instead 
# that would flip between 0 to 1 and pass to the solved? method.  
# I later realized that this would be redundant and passing @guess
# would be much more elegant.  

# As for refactoring, there was not much room for it.  I think 
# I'm getting a good hang of one-liner conditionals like unless, 
# but I don't think there is much to shorten for the return high/low/correct
# statement.  I did look into case but that alternative was not very
# 	good since there is no set range that can be defined by high/low.
	
