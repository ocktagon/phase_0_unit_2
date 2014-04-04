# U2.W4: Cipher Challenge


# I worked on this challenge [with: Kevin Kang].



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



# def north_korean_cipher(coded_message)
#   input = coded_message.downcase.split("") # take input and convert to all lower case characters and put each characters in the element of array input
#   decoded_sentence = []   # create decoded_sentence array
#   cipher = {"e" => "a",   # cipher is a conversion table where key is a input and value is output
#             "f" => "b",   
#             "g" => "c",   
#             "h" => "d", 
#             "i" => "e", 
#             "j" => "f",
#             "k" => "g",
#             "l" => "h",
#             "m" => "i",
#             "n" => "j",
#             "o" => "k",
#             "p" => "l",
#             "q" => "m",
#             "r" => "n",
#             "s" => "o",
#             "t" => "p",
#             "u" => "q",
#             "v" => "r",
#             "w" => "s",
#             "x" => "t",
#             "y" => "u",
#             "z" => "v",
#             "a" => "w",
#             "b" => "x",
#             "c" => "y",
#             "d" => "z"}
            
#   input.each do |x| # for each element in the array ..
#     found_match = false  #    Why would this be assigned to false from the outset? What happens when it's true?
#     cipher.each_key do |y| #     What is #each_key doing here?
#       if x == y  # What is this comparing?comparing each string character to the each key values in cipher Where is it getting x? Where is it getting y? What are those variables really?
#         puts "I am comparing x and y. X is #{x} and Y is #{y}." #output confirmation
#         decoded_sentence << cipher[y] #if there is a match the value is popped into the array
#         found_match = true
#         break  # Why is it breaking here? b/c we don't want the code to continue after the match is found
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? if it corresponds to any of special characters push empty space 
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do? if it is any number between 0-9 just insert the number as is into decoded sentence
#         decoded_sentence << x
#         found_match = true
#         break
#       end 
#     end
#     if not found_match  # What is this looking for? If there is no match insert the same character as is
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("") #put all the strings together and declare a variable 
 
#   if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
#   end  
#   return decoded_sentence # What is this returning? returns newly formatted output that is joined
# end


# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # take input and convert to all lower case characters and put each characters in the element of array input
  decoded_sentence = []   # create decoded_sentence array

# Go through range A-Z
# Call inject({}) method to range
# Awesome automation!
    cipher = ('a'..'v').inject({}) do |cipher,x|
      cipher["a"] = "w" 
      cipher["b"] = "x" 
      cipher["c"] = "y" 
      cipher["d"] = "z" 
      cipher["#{(x.ord  + 4).chr}"]  = x
      cipher
    end

  input.each do |x| 
    found_match = false 

    cipher.each_key do |y| 
    #   if x == y  
    #     puts "I am comparing x and y. X is #{x} and Y is #{y}." 
    #     decoded_sentence << cipher[y] 
    #     found_match = true
    #     break  
    #   # %w{"@" "#" "$" "%" "^" "&" "*"}.include?(x)
    #   elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" 
    #     decoded_sentence << " "
    #     found_match = true
    #     break
    #   elsif (0..9).to_a.include?(x) 
    #     decoded_sentence << x
    #     found_match = true
    #     break
    #   end
      
## Refactoring of if/else but doesn't work with the breaks      
      case x
    		when y
    			decoded_sentence << cipher[y]
    			found_match = true
    			break
    		when "@","#","$","%","^","&","*"
    			decoded_sentence << " "
    			found_match = true
    			break
    		when (0..9).to_a.include?(x)
    			decoded_sentence << x
    			found_match = true
    			break    		
    		end

    		# ONE-LINER IFS THAT DIDN'T WORK BECAUSE THE BREAKS DIDN'T WORK
        # decoded_sentence << " " if x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*"
        # decoded_sentence << cipher[y] if x == y
        # decoded_sentence << x if (0..9).to_a.include?(x) 
        # found_match = true       
    end
    decoded_sentence << x unless found_match
    # if not found_match  # What is this looking for? If there is no match insert the same character as is
    #   decoded_sentence << x
    # end
end

  decoded_sentence = decoded_sentence.join("")  
 
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence 
end



# Driver Code:
# # These tests return true
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# # This just outputs the strings as is
# p north_korean_cipher("m^aerx%e&gsoi!") 
# p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") 
# p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") 
# p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") 
# p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") 
# p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") 


# Reflection
# The best thing that went well for the cipher refactoring exercise was that we were able to apply the ASCII
# mappings for the alphabetical characters and map them with char that was 4 positions off from the char in question.
# There was no common rule to apply for a,b,c,d so those were managed as exceptions.  The end result code may not be perfect, 
# but still felt it was a lot more efficient than the original code.  

# For the if/else statement, we spent a about 2 hours trying to figure out how to optimize the conditionals 
# into smart one-liners.  We were so close on this, but things seem to fail when handling the space... 
# too many are printed out.  Still trying to figure out why this is happening. However, we did find a case statement
# that made the conditional elsif statements look a lot cleaner. 


	
 