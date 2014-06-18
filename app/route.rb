require_relative 'location'

class Route
  def initialize(locations, map)
    @locations = locations
    @map = map
  end

  def driving_distance
    previous_location = locations.shift
    locations.reduce(0) do |total_distance, next_location|
      total_distance += map.driving_distance(previous_location, next_location)
      previous_location = next_location
      total_distance
    end
  end

  private
  attr_reader :map, :locations
end
