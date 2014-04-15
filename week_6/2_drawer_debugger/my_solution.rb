# U2.W6: Drawer Debugger


# I worked on this challenge [by myself].


# 2. Original Code

class Drawer

  attr_reader :contents

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing?
		@contents.delete(item)
	end

	def dump  # what should this method return?
		puts "Your drawer is empty."
	end

	def view_contents
	  puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end


class Silverware

	attr_reader :type

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		@clean = true
	end

end

  def assert
  	raise "Assertion failed!" unless yield
	end
 
# name = "bettysue"
# assert { name == "bettysue" }
# assert { name == "billybob" }
knife1 = Silverware.new("knife")
spoon1 = Silverware.new("spoon")
fork1 = Silverware.new("fork")

silverware_drawer = Drawer.new

silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(spoon1)
silverware_drawer.add_item(fork1) 
silverware_drawer.view_contents

# silverware_drawer.remove_item
silverware_drawer.view_contents

sharp_knife = Silverware.new("sharp_knife")

silverware_drawer.add_item(sharp_knife)
silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?


removed_fork = silverware_drawer.remove_item(fork1) #add some puts statements to help you trace through the code...
removed_fork.eat

#BONUS SECTION
puts removed_fork.clean_silverware

# DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 