require_relative 'plane'

class Airport
  def initialize(max_cap = 2) # initialises the airprt array and the max_cap
    @planes = []
    @max_cap = max_cap
  end

  def land(plane)
    airport_full # checks if the airport has spare capacity

    @planes.push(plane)
    puts "Plane has landed"
  end

  def take_off(plane)
    if @planes.include?(plane) == false # checks whether the plane is at the airport
      raise "Plane not at the airport!"
    end
    @planes.delete(plane)
    plane
  end

  def airport_full
    if @planes.length == @max_cap
      raise "Airport is full"
    end
  end

  def list_landed
    puts @planes
  end
end