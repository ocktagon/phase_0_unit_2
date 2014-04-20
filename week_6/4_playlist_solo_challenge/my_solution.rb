# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [by myself].

# Pseudocode
# Class named Song 
#   CREATE method initialize with arguments for title, author
#   CREATE method play
#     return array.first
#   sub class named Playlist
#     CREATE method initialize which takes many song var names
#       Initialize playlist as empty array
#       PUSH many song var names into playlist
#     CREATE method add which takes many song var names
#       PUSH many song names into playlist
#     CREATE method num_of_tracks
#       return count of array length
#     CREATE method remove, take one var argument
#       DELETE var from array
#     CREATE method includes?, take one string
#       return true if array includes string
#     CREATE method play_all
#       return array
#     CREATE method display
#       return array
#   END sub class
# END class

# Initial Solution

# Class named Song 

class Song
  attr_accessor :title, :artist


	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		puts "Playing: " + "#{title}" + ", " + "#{artist}"
	end
end

class Playlist
  attr_accessor :playlist
  def initialize(*song)
  	@playlist = []
    song.each{ |s| playlist << s }
  end
  def add(*song)
    song.each{ |s| playlist << s }
  end

  def num_of_tracks
  	playlist.length 
  end

  def remove(song)
    playlist.delete(song)
  end

  def includes?(string)
  	return true if playlist.include?(string)
  end

  def play_all
  	playlist.each {|s| s.play} 
  end

  def display
  	p playlist
  end

end



# Refactored Solution
# I already refactored my solution on the first stab. 





# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display





# Reflection 
# This was a great exercise in trying to master one-liner code.  
# Unless there is secret trick to create an array and add things to it in one-line
# I don't think the code could get any more efficient. 

# I had the hardest time trying to understand what to do with the 
# playlist method since the instances that were displayed in the array didn't 
# make sense to me at first, but then I realized that I could simply call single play on every one that I defined in the 
# earlier Song class.  
