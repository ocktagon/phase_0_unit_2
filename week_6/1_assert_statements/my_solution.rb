# U2.W6: Testing Assert Statements


# I worked on this challenge [by myself].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end
 
# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
# When method asset runs and compares to name "bettysue"
# IF name == "bettysue", then return nil
# IF name == "billybob" then return nil
#   else 
#     raise a RunTime error with message "Assertion failed!"
#   	p line of code where assert statement that returned false was defined
#   	p line of code returning false
#   	Location of Ruby where the issue is occurring (i.e. <main>)


# 3. Copy your selected challenge here



# puts boggle_board[0][1] == "r"   # returns boggle_board[row_number][column_number]
# puts boggle_board[2][1] == "c" 
# puts boggle_board[3][3] == "e" 
# puts boggle_board[2][3] == "x" 



# 4. Convert your driver test code from that challenge into Assert Statements

assert { boggle_board[0][1] == "r" }
assert { boggle_board[2][1] == "c" }
assert { boggle_board[3][3] == "e" }
assert { boggle_board[2][3] == "x" }



# 5. Reflection 
This was a very straightforward exercise.  So it seems like 
it's relatively easy to create a specific method for testing purposes, 
and wrap specific tests with the method to make tests more handy.  
I would assume that this would be much more scalable to add more detail to the test during development. 

