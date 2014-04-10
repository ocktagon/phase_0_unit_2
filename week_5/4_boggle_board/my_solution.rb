# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself].

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"],
								["s", "u", "p", "z"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# create method that takes array name and coordinates
# Use map to select elements according to coordinatds, then join the output

# Initial Solution

def create_word(board, *coords)
  coords.map { |coord| board[coord.first][coord.last]}.join("")
end

puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3])
puts create_word(boggle_board, [0,1], [0,2], [1,2])
puts create_word(boggle_board, [0,2], [3,2], [1,0], [4,0],[4,1],[4,3],[4,1],[3,2],[1,0])

# Refactored Solution
# I couldn't refactor this any more efficiently. 


# DRIVER TESTS GO BELOW THIS LINE
puts create_word(boggle_board, [3,0], [0,3], [4,0],[1,3]) == "test"



# Reflection 
# Very good exercise to learn how to use nexted arrays.  Was wondering how to do that
# since they were introduced in the preliminary readings for collections. 
#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# METHOD get_row with input of a number 
# puts boggle_board[row]
# Initial Solution

# def get_row(board, row)
# 	output = []
#   board[row].each do |x|
#   	output << x
#   end
#   p output
# end

# get_row(boggle_board, 1)

# Refactored Solution

def get_row(board, row)
  p board[row].select{|item| item}
end

get_row(boggle_board, 1)

# DRIVER TESTS GO BELOW THIS LINE
puts get_row([["t","e","s","t"]],0) == ["t","e","s","t"]

# Reflection 
# I think the refactoring went very well in this exercise since I was able to use
# the select method to eliminate the need to create a new array and push the values
# into it.   The p is a good shorthand so I don't need to specify .inspect to display
# an output for an array. 


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# Method get_col get col number
# Use transpose to get the flipped output.

# Initial Solution
# def get_col(board,col)
# 	trans_arr = board.transpose
# 	p trans_arr[col].select{|item| item}
# end

# get_col(boggle_board,1)  #=>  ["r", "o", "c", "a"]



# Refactored Solution
def get_col(board,col)
	p board.transpose[col].select{|item| item}
end

get_col(boggle_board,1)  #=>  ["r", "o", "c", "a"]


# DRIVER TESTS GO BELOW THIS LINE
puts "Driver Tests"
puts boggle_board[0][1] == "r"   # returns boggle_board[row_number][column_number]
puts boggle_board[2][1] == "c" #=> should be true
puts boggle_board[3][3] == "e" #=> should be true
puts boggle_board[2][3] == "x" #=> should be false


# Reflection 
# It was interesting to see how really simple and compact I was able to make the command
# using transpose.  The initial solution created a variable called trans_arr in attempt
# to make the code more readable.  In refactoring, realized I don't even need the variable
# and call everything in one line. 

