# U2.W4: Homework Cheater


# I worked on this challenge [by myself].

#user stories
# As a user, I want to
# Create a generic template
# Use the generic template (without overwriting it)
# Input a title into the template
# Identify and pass in a person/place/topic into the template
# Input an important date into the template
# Input my thesis statement into the template
# Output my finished template onto the screen
# BONUS
# Use the appropriate pronoun for a person (male or female), place, or thing (HINT: this may be a good place to try creating an object...)
# Modify singular and plural nouns based on basic rules. (ie. you probably don't want to bother with something as crazy as "fish")
# Refer to a person by the last name after the first use of their name




# 2. Pseudocode

# Input: 
# INSERT input into method essay writer that takes title, person/place/topic, date, thesis_st, pronoun
# IF pronoun is male, use he, his him
# ELSIF pronoun is female - use she her,
# ELSIF pronoun is thing - use it 
# ELSIF pronoun is plural use they, them
# ELSIF pronoun is myself use I me. 
# User inputs title
# User selects person/place/topic
# User inputs date
# User inputs thesis_statement
# insert all the values into special template with if/elsif adjustments
# Output: Finished template with pronoun adjustments
# Steps:



# 3. Initial Solution


# class String
#   def titleize
#     split(/(\W)/).map(&:capitalize).join
#   end
# end

# def essay_writer (title, noun, date, thesis_st, pronoun)
# # Conditionals to determine pronoun details - subject, object, reflexive, subj/verb agreement
# 	if pronoun == "male"
# 		sub_pro = "he"
# 		obj_pro = "him"
# 		refl_pro = "himself"
# 		sv_agree = "is"
# 	elsif pronoun == "female"
# 		sub_pro = "she"
# 		obj_pro = "her"
# 		refl_pro = "herself"
# 		sv_agree = "is"
# 	elsif pronoun == "plural"
# 		sub_pro = "they"
# 		obj_pro = "them"
# 		refl_pro = "themselves"
# 		sv_agree = "are"
# 	else
# 	end

# 	puts "----------------------------"
# 	puts "#{title.upcase}"	
# 	puts
# 	puts "#{noun.titleize} #{sv_agree} absolutely amazing."
# 	puts "We can tell that #{sub_pro} really worked hard."  
# 	puts
# 	puts "#{thesis_st}"
# 	puts
# 	puts "There was so much done back in #{date}!!"
# 	puts
# 	puts "The only regret #{sub_pro} should have #{sv_agree} not to drive in an electric car."  
# 	puts "Like, how can #{sub_pro} live with #{refl_pro}???"
#   puts
#   puts "What a great essay!"
# 	puts "----------------------------"
# end


# puts "WELCOME TO ESSAY HELPER!"
# puts
# puts "Enter title name:"
# title = gets.chomp

# puts "Enter date:"
# date = gets.chomp

# puts "Enter the name of your hero:"
# noun = gets.chomp  

# puts "Is your hero male, female, or plural?"
# pronoun = gets.chomp

# puts "Enter a quick highlight accomplishment:"
# thesis_st = gets.chomp


# essay_writer(title, noun, date, thesis_st, pronoun)




# 4. Refactored Solution

class String
  def titleize
    split(/(\W)/).map(&:capitalize).join
  end
end

def essay_writer (title, noun, date, thesis_st, pronoun)
# Conditionals to determine pronoun details - subject, object, reflexive, subj/verb agreement
	if pronoun == "male"
		sub_pro, obj_pro, refl_pro, sv_agree = "he", "him", "himself", "is"
	elsif pronoun == "female"
    sub_pro, obj_pro, refl_pro, sv_agree = "she", "her", "herself", "is"
	elsif pronoun == "plural"
    sub_pro, obj_pro, refl_pro, sv_agree = "they", "them", "themselves", "are"
	else
	end

title = title.upcase
noun = noun.titleize

	puts "----------------------------"
	puts "#{title}"	
	puts
	puts "#{noun} #{sv_agree} absolutely amazing."
	puts "We can tell that #{sub_pro} really worked hard."  
	puts
	puts "#{thesis_st}"
	puts
	puts "There was so much done back in #{date}!!"
	puts
	puts "The only regret #{sub_pro} should have #{sv_agree} not to drive in an electric car."  
	puts "Like, how can #{sub_pro} live with #{refl_pro}???"
  puts
  puts "What a great essay!  #{sub_pro.capitalize} #{sv_agree} so proud!!"
	puts "----------------------------"
end


# puts "WELCOME TO ESSAY HELPER!"
# puts
# puts "Enter title name:"
# title = gets.chomp

# puts "Enter date:"
# date = gets.chomp

# puts "Enter the name of your hero:"
# noun = gets.chomp  

# puts "Is your hero male, female, or plural?"
# pronoun = gets.chomp

# puts "Enter a quick highlight accomplishment:"
# thesis_st = gets.chomp


# essay_writer(title, noun, date, thesis_st, pronoun)



# 1. DRIVER TESTS GO BELOW THIS LINE

essay_writer("I hate teen idols", "Justin Bieber", "1/1/2013", "He's a good dancer and he drives a Lamborghini", "male")
essay_writer("Bring Back the 80s", "cyndi Lauper", "1/2/2013", "She comes back resilient.  Time after time...","female")
essay_writer("Another boy band???", "the backstreet boys", "1/3//2013", "I just gotta hear you say.  I want it that way!", "plural")


# # Found a way to drive test if a Class exists but wasn't useful for this exercise!
# # def class_exists?(class_name)
# #   eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
# # end






# 5. Reflection 
# Two exercises so far this week, and I'm still confused with driver code.  The way the instructions are written, 
# it seems slike writing the driver code comes early in the process, but I really can't imagine myself being able to
# write the driver code before I at least pseudocode and map out what I want to write.  In this exercise, I wrote some
# test data with dummy names like Justin bieber, but not sure if this serves the purpose.  I do think it allowed for testing.

# The other thing I'm not sure about is what to really test for using driver code. 
# In a straight forward string interpolation solution like this where I'm mostly passing through the fields into a 
# generic template to put string, I'm not really sure what to test at all, thus why I used test data instead. 

# As for tricks that were helpful, I used gets.chomp for practice.  Most of the code went well, but I ended up throwing
# away some code where I initially asked for a noun_choice number (i.e. 1: Justin Bieber, 2: Cyndi Lauper, etc.),
# and from that answer the solution would automatically understand the noun and pronoun without having to ask the user.
# I got the IF statements right, but for some reason the noun/pronoun variables would not update when i nested
# them under an IF statement, so I gave up for now and just asked the user all the questions to gets.chomp.  
# I'll have to come back to that in future to understand what went wrong.   


