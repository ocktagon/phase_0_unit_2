#Pseudo code 

# INPUT separate_comma method which accepts a num
# 
# Convert num to string and split every digit into an array
# IF array.length is smaller than 4 then return as is
# IF array.length is 4 and above
  # Then create new_array
  # start popping old array into new array until length is reached.
  # everytime array # unshifted reaches is amuliple of 3, insert a comma 
# OUTPUT return array if less than 4 digits, return new array if other

def separate_comma(num)
  array = num.to_s.split('')
  di_count = array.length
  new_array = []
	if di_count < 4
		return array.join
	else
		i = 1
		while i <= di_count
		  new_array.unshift(array.pop)
		  new_array.unshift(",") if i%3 == 0 
		  i += 1
		end
		# code to clean up too many comma insertions
		new_array.shift if new_array.first == ","
		return new_array.join
	end
end



#Driver Code
puts separate_comma(567989998)
puts separate_comma(10000)
puts separate_comma(100000)
puts separate_comma(1000000000000000000000)

puts separate_comma(1000) == "1,000"
puts separate_comma(1000000) == "1,000,000"
puts separate_comma(0) == "0"
puts separate_comma(100) == "100"


# Refactoring

# Reflection
