# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself].


# Original Solution
# Borrowed jpabico's code!

# class CreditCard

# 	def initialize(ccnum)
# 		@ccnum = ccnum
# 		raise ArgumentError.new("There must be exactly 16 digits in a credit card number") if ccnum.to_s.length != 16 
# 	end

# 	def check_card
# 		ccarray = @ccnum.to_s.split("")
# 		ccarray.map! { |x| x.to_i }

# 		for i in 0...ccarray.length
# 			ccarray[i] = ccarray[i] * 2 if i%2 == 0
# 		 	ccarray[i] = ccarray[i]/10 + ccarray[i]%10 if ccarray[i] >=10
# 		end

# 		ccarray.inject(:+) % 10 == 0 ? true : false	
# 	end

# end




# Refactored Solution

class CreditCard

	def initialize(ccnum)
		@ccnum = ccnum
		raise ArgumentError.new("There must be exactly 16 digits in a credit card number") if ccnum.to_s.length != 16 
	end

	def check_card
		ccarray = @ccnum.to_s.split("").map! { |x| x.to_i }

		ccarray.each {|i|
			i = i * 2 if i % 2 == 0
			i = i / 10 + i % 10 if i >=10
		}
		
		ccarray.inject(:+) % 10 == 0 ? true : false	
	end

end



# DRIVER TESTS GO BELOW THIS LINE

test_card_1 = CreditCard.new(8651243992187311)
p test_card_1.check_card == true

test_card_2 = CreditCard.new(4545454545454545)
p test_card_2.check_card == false




# Reflection 
# Jpabico's code was already super efficient so didn't really have much to 
# refactor.  I did two things - make the first alteration (split + map) of ccarray into one line. 
# I also changed the for/in statement to an each do statement that basically does
# 	the same thing.  In essence the code has not changed but maybe it's a bit more readable?
# Highly subjective though, as the code before refactoring looked fine too. 
