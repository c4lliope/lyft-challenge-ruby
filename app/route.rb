require_relative 'location'

class Route
  def initialize(locations, map)
    @locations = locations
    @map = map
  end

  def driving_distance
    sum_driving_distance(intermediate_routes)
  end

  private
  attr_reader :map, :locations

  def sum_driving_distance routes
    routes.reduce(0) do |total_distance, intermediate_route|
      total_distance + intermediate_route.driving_distance
    end
  end

  def intermediate_routes
    [].tap do |intermediate_routes|
      destinations.each do |destination|
        origin = intermediate_routes.last.destination rescue locations.first
        intermediate_routes << SimpleRoute.new(origin, destination, map)
      end
    end
  end

  def destinations
    locations[1..-1]
  end

  class SimpleRoute
    def initialize(origin, destination, map)
      @origin = origin
      @destination = destination
      @map = map
    end

    def driving_distance
      map.driving_distance(origin, destination)
    end

    attr_reader :origin, :destination, :map
  end
end
