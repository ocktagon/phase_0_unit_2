# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself].

# 2. Pseudocode


# 1. Starting with the second to last digit, double every other digit until you reach the first digit

# 2. Sum all the untouched digits and the doubled digits (doubled digits need to be broken apart, 10 becomes 1 + 0)

# 3. If the total is a multiple of ten, you have received a valid credit card number!

# ```ruby
# Example given 4563 9601 2200 1999
# Origin: 4   5   6   3   9   6   0   1   2   2   0   0   1   9   9   9
# Step 1: 8   5  12   3  18   6   0   1   4   2   0   0   2   9  18   9
# Step 2: 8 + 5 + 1 + 2 + 3 + 1 + 8 + 6 + 0 + 1 + 4 + 2 + 0 + 0 +2+ 9 + 1 + 8 + 9
# Step 3: 70 (total above) % 10 == 0
# Step 4: Profit
# ```

# Your class will need to return `true` or `false` when we call the `#check_card`.  Your class needs to be initialized with a credit card number that is exactly 16 digits otherwise you should receive an `ArgumentError`.

# Input: A cc number
# Output: true or false after checking if the card is valid
# Steps:
# INITIALIZE 
# UNLESS cc# is 16 digits, raise an error
# initialize cc number

# check_card
# Push cc number into an array
# FOR all even array positions, multiply by 2
# Get sum of up all positions 
# Return true unless sum % 10 != 0

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
# class CreditCard

# 	def initialize(cc_num)
# 		raise ArgumentError.new("Not 16-digits yo!") if cc_num.to_s.size != 16
# 		@cc_num = cc_num
# 	end

# 	def check_card
# 		cc_array = @cc_num.to_s.split('')
# 		cc_array = cc_array.collect!{|x| x.to_i}
		
# 		cc_array.map!.with_index do |x,i|
# 			if i.even? # Replace all odd positions with *2, leave even positions as is
# 				x * 2
# 			else
# 				x
# 			end
# 		end

# 		#join/split array again 
# 		cc_array = cc_array.join.split('')
# 		cc_array = cc_array.collect!{|x| x.to_i}

#     #Find sum
# 		total = cc_array.inject{|sum,x| sum + x }

# 		if total % 10 == 0
# 			return true			
# 		else
# 			return false
# 		end
# 	end
# end


# 4. Refactored Solution

class CreditCard

	def initialize(cc_num)
		raise ArgumentError.new("Not 16-digits yo!") if cc_num.to_s.size != 16
		@cc_num = cc_num
	end


	def check_card
		
		cc_array = @cc_num.to_s.split('').collect!{|x| x.to_i}.map!.with_index do |x,i|
		  i.even? ? x * 2 : x
		end

		total = cc_array.join.split('').collect!{|x| x.to_i}.inject{|sum,x| sum + x }

		return false if total % 10 != 0
		return true

	end
end




# 1. DRIVER TESTS GO BELOW THIS LINE


# puts "True Card"
# puts CreditCard.new(4408041234567893).check_card == true
# puts "False Card"
# puts CreditCard.new(4408041234567892).check_card == false
# puts "Invalid Card"
# puts CreditCard.new(44080412345678930)



# 5. Reflection 
# This was a huge learning for me.  I ended up spending 3-4 hrs trying to debug my code when there was in 
# fact nothing wrong with the main code, but that I made a simple typo in initialize to type cc_num = @cc_num,
# when it should have been @cc_num = cc_num.  Mistakes like this are hard to find to cause, especially
# when I'm focusing on other places in the code.  

# Found some awesome shorthand notations when refactoring.  The firrst being the if/else statement in one-line using just a 
# question mark and colon.  That to me is not easy to read at first glance, but like that it can Replace
# 3-4 lines of code.  I also found that if I want to do multiple operations on an array, I can just keep on adding 
# them on the same line.   Not sure if this is a good practice, but did notice that it reduced the need to 
# keep on creating new variables over and over.    Also am loving the one-liner ifs to return true/false.


