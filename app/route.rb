require_relative 'location'

class Route
  def initialize(locations, map)
    @locations = locations
    @map = map
  end

  def driving_distance
    map.driving_distance(locations.first, locations.last)
  end

  private
  attr_reader :map, :locations
end
