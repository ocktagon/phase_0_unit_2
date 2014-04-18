# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode
# Create class for BoggleBoard
# DEF initialize with grid as input
#   @grid variable
# DEF create with *coords input
# display same as boggle_board using map methods


# 3. Initial Solution
class BoggleBoard
 
  def initialize(grid)
  	@grid = grid
  end

  def create(*coords)
  	coords.map { |coord| @grid[coord.first][coord.last]}.join("")
  end
 
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 



puts boggle_board.create([2,1], [1,1], [1,2], [0,3])
puts boggle_board.create([0,1], [0,2], [1,2])
puts boggle_board.create([0,2], [3,2], [1,0], [4,0],[4,1],[4,3],[4,1],[3,2],[1,0])


# DRIVER TESTS GO BELOW THIS LINE
puts boggle_board.create([2,1], [1,1], [1,2], [0,3]) == "code"



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:


# puts create_word([3,0], [0,3], [4,0],[1,3]) == "test"


# 5. Reflection 