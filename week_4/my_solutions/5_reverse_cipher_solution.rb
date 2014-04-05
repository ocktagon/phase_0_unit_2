# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    # this creates an array where each char represents one element and calls it alphabet
    alphabet = ('a'..'z').to_a
    # Takes the alphabet array, uses the zip array to assign merge element to sa key position in a hash, then maps those keys 
    # to a new alphabet array that rotates each element by the element 4 positions later than it. 
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
    # define spaces as an array of special char
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    #defines original_sentence as input converted to all lowercase letters
    original_sentence = sentence.downcase
    #creates array called encoded_sentence
    encoded_sentence = []

    # for each character in the string do
    original_sentence.each_char do |element|
      # if the cipher has the element, push the value of the element into the new array
      if cipher.include?(element)
        encoded_sentence << cipher[element]
      # if cipher has a space, select randomly from the 7 special chars, push sp char to new array
      elsif element == ' '
        encoded_sentence << spaces.sample
      # otherwise, push the element as is to the new arrray
      else 
        encoded_sentence << element
      end
     end
    #output the encoded sentence array as a string
    return encoded_sentence.join
end

# I think every step is necessary in this code, couldn't find a good way to refactor it other than 
# not creating a new array and destructively replacing the original sentence.  From what I am reading 
# online, this doesn't seem to be a good practice. 

# Questions:
# 1. What is the .to_a method doing?
# It converts the input (i.e. input string) to an array that makes each char a separate element.
# 2. How does the rotate method work? What does it work on?
# The rotate method shifts all the elements forward or backwards depending on the number specified.
# It works specifically on the array posiiton of the elements.
# 3. What is `each_char` doing?
# each_char is telling Ruby to do operations on each char in the string 
# 4. What does `sample` do?
# sample randomly selects n elements from an array
# 5. Are there any other methods you want to understand better?
# Other methods not in this that I need to understand bettter are inject and gsub.
# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# The part where the array is rotated is very slick.  I think this combined with case notation makes things easier to read.

# 7. Is this good code? What makes it good? What makes it bad?
# I think this is good code because it is organized where some pre-encoding calculations are done with variables
# first, and then the encoding steps are lumped into the conditional branches.  Like my original, I'd probably use
# case statements to make it more readable

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 

