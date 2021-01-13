require_relative 'plane'

class Airport

  attr_reader :aircraft_list, :capacity

  def initialize(max_capacity = 5)
    @aircraft_list = []
    @capacity = max_capacity
  end

  def land(plane)
    raise "The hangar is full" if aircraft_list.length >= capacity

    aircraft_list << plane
  end

  def take_off(plane)
    aircraft_list.each do |aircraft|
      if aircraft == plane
        aircraft_list.delete(plane)
        return plane
      end
    end
  end

end
