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
class CreditCard

	def initialize
	end

	def check_card
	end

end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
