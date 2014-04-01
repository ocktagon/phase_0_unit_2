# U2.W4: 1_create_accountability_groups


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: array of ~26 names
# Output: 
# A list of accountability groups for 3 different units, 4ppl or more each

# Steps: 
# THESE ARE SOME INDEX VARIABLES I MIGHT USE
# gr_modifier = array.length % 4 (should be 3, 2, or 1)
# gr_index = array.length / 4
# 
# MAIN CODE TO CREATE THE GROUPS
# Do this for 3 units
# Take input array and randomize on the spot (shuffle!)
# Unit = Group break out using a.each_slice(4).to_a

# SPECIAL CODE TO BALANCE GROUPS LESS THAN 4
# Set gr_modifier = unit1[-1].length
# IF gr_modifier < 4
    # temp_array = unit1[-1].pop(gr_modifer)
    # i=0
    # while i < gr_modifier
    # 	unit1[i] << temp_array.first
    # end
# FOR each unit do
#   sort each array to clean up
# END LOOP
#
# OUTPUT RESULTS
# puts "ACCOUNTABILITY GROUPS"
# puts "UNIT 1 --------"
# units.each do |n|
# puts n+1 + ":" + "#{Unit1[n]}"
#end



# 3. Initial Solution


array = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally", "Andrew McDonald", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff", "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino", "Eoin McMillan", "Eric Wehrli", "Hunter Chapman", "Jacob Persing", "Jon Pabico", "Mary Huerster", "Parjam Davoody", "Samuel Davis", "Sebastian Belmar", "Shawn Seibert", "William Butler Bushyhead", "Yuzu Saijo", "Christiane Kammerl"]

def create_accountability_groups(array)
	array.shuffle!
	unit1 = array.each_slice(4).to_a
  
  array.shuffle!
	unit2 = array.each_slice(4).to_a

  array.shuffle!
	unit3 = array.each_slice(4).to_a
  
  gr_mod1 = unit1[-1].length
  gr_mod2 = unit2[-1].length
  gr_mod3 = unit3[-1].length

  if gr_mod1 < 4
  	temp_array = unit1[-1].pop(gr_mod1)
  	unit1.delete(unit1[-1])
    i = 0
    while i < gr_mod1
  	  unit1[i].push(temp_array[i])
  	  i += 1
    end
  end

  if gr_mod2 < 4
  	temp_array = unit2[-1].pop(gr_mod1)
  	unit2.delete(unit2[-1])
    i = 0
    while i < gr_mod2
  	  unit2[i].push(temp_array[i])
  	  i += 1
    end
  end

  if gr_mod3 < 4
  	temp_array = unit3[-1].pop(gr_mod1)
  	unit3.delete(unit3[-1])
    i = 0
    while i < gr_mod3
  	  unit3[i].push(temp_array[i])
  	  i += 1
    end
  end

  unit1.each {|element| element.sort!}
  unit2.each {|element| element.sort!}
  unit3.each {|element| element.sort!}

  puts "ACCOUNTABILITY GROUPS"
  puts "-------- UNIT 1 --------"
    puts "----"
    unit1.each do |n|
    puts n
	  puts "----"
  end
  puts "-------- UNIT 2 --------"
  unit2.each do |n|
    puts n
	  puts "----"
  end  
  puts "-------- UNIT 3 --------"  
  unit3.each do |n|
    puts n
	  puts "----"
  end  

  #This is where to insert driver tests when I need them

end

create_accountability_groups(array)


# 4. Refactored Solution
# I am stumped on how to refactor this code.  
# I wonder if there's any way to set 'dynamic variables' so I can nest the numbering of variables (i.e. unit1,unit2,unit3) in a loop, 
# but can't find anything on the internet that allows me to do something sophisticated like that.  
# I know my inefficiencies are where I'm doing the same action to the array 3 times (once per unit).  
# I would like to refactor there but don't know how.  



# 1. DRIVER TESTS GO BELOW THIS LINE

# This test is to check whether each group created is 4 people or more

# puts "Unit 1 Group Size Tests"
# unit1.each do |element|
# 	puts element.length >= 4
# end

# puts "Unit 2 Group Size Tests"
# unit2.each do |element|
# 	puts element.length >= 4
# end

# puts "Unit 3 Group Size Tests"
# unit3.each do |element|
# 	puts element.length >= 4
# end


# This is a test to check if any groups are identical.  
# I took the stance of accepting dupe names, as long as the groups weren't entirely the same
# If they were the same this test would find false entries, and user can run the randomizer again.

# puts "Are They Unique Samples? Test"
# puts "Group 1: "
# puts unit1[0] != unit2[0]|| unit2[0] != unit3[0] || unit3[0] != unit1[0] 
# puts "Group 2: " 
# puts unit1[1] != unit2[1] || unit2[1] != unit3[1] || unit3[1] != unit1[1] 
# puts "Group 3: " 
# puts unit1[2] != unit2[2] || unit2[2] != unit3[2] || unit3[2] != unit1[2] 
# puts "Group 4: " 
# puts unit1[3] != unit2[3] || unit2[3] != unit3[3] || unit3[3] != unit1[3] 
# puts "Group 5: " 
# puts unit1[4] != unit2[4] || unit2[4] != unit3[4] || unit3[4] != unit1[4] 



# 5. Reflection 
# This was a very frustrating exercise for me, because I really couldn't figure out a 
# simpler way to solve it.  It took me nearly 4-5 hours do the repetitive code I have put together. 

# After scavenging the web I found that the .shuffle! and sorting the units into array of arrays would be an ideal approach.

# As for trying to avoid putting the same people together more than once, I took the position of 
# accepting that it would be fine to have some duplicate people, as validating for that would make my code more inefficient.
# I put in a driver test to show 'false' in some cases where 1 or more of the groups are exactly the same, 
# but couldn't figure out a better way to represent the test.

# If this program is run 3 times in a row, it will definitely give 3 different outputs.  
# I don't think it needs to remember the past, as I'm betting on 3 unit samples seldom being exactly the same.
# It is intentionally designed to do a random shuffle of the total people, and return 3 units worth of 4-7 person groups.
# The cool design that I think works well is that it can adapt to changes in classroom size, not just 26 people. 
# The other notable design is that each group number will never go under 4 people, and one of my driver tests was made to check that.

# In a scenario where the number of units increased and I had higher probability of dupes, 
# i might have to think about a more elegant design that focuses on getting unique samples.
# For this week, I'm exhausted already on exercise 1 and I'll call it done. 





