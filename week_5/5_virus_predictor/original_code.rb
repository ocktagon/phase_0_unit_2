# U2.W5: Virus Predictor

# I worked on this challenge [by myself].

# EXPLANATION OF require_relative
# Require_relative complements the builtin method require by allowing 
# to load a file that is relative to the file containing the require_relative statement.

require_relative 'state_data'

class VirusPredictor

# This is to initialize the instance of the class with the 5 main variables that are also represented in the state_data file

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# looks like this method determines predicted deaths using 3 inputs, and estimates speed of spread with 2 inputs. 
# create a report for all 50 states, not just the 4 listed below.  
  def virus_effects #HINT: What is the SCOPE of instance variables?
     predicted_deaths
     speed_of_spread
  end


 
  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  # this allows methods to be restricted from public, setting this means that the  method can never be
  # called with an explicit receiver.  In other words:
  # - the private method can be called from within a class it is declared in as well as all subclasses of the class
  # - it can never be called from outside the class hierarchy where it was defined. 

# this method returns an estimated number of deaths based on a multiplier that adjusts based on a population density threshold.  
# It then uses floor method to estimate to the nearest lower bound integer.
  def predicted_deaths
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else   
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# This method returns an estimate of how long the outbreak will take to spread across the state.  
# The calculation again adjusts based on population density thresholds and adjusts by 0.5 months. 
# If the population density figure does not fall within the standard ranges, it defaults to 2.5 months.
  def speed_of_spread #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state,v|
  vp = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population], STATE_DATA[state][:region], STATE_DATA[state][:regional_spread]) 
  vp.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects

