require_relative 'location'

class Route
  def initialize(locations, map)
    @locations = locations
    @map = map
  end

  def distance
    sum_distance(intermediate_routes)
  end

  def origin
    locations.first
  end

  def destination
    locations.last
  end

  def to_s
    "from " + locations.map(&:to_s).join(" to ")
  end

  def ==(o)
    o.class == self.class && o.locations == @locations && o.map == @map
  end
  alias_method :eql?, :==

  attr_reader :map, :locations

  private

  def sum_distance routes
    routes.reduce(0) do |total_distance, intermediate_route|
      total_distance + intermediate_route.distance
    end
  end

  def intermediate_routes
    [].tap do |intermediate_routes|
      destinations.each do |destination|
        origin = intermediate_routes.last.destination rescue locations.first
        intermediate_routes << Leg.new(origin, destination, map)
      end
    end
  end

  def destinations
    locations[1..-1]
  end

  class Leg
    def initialize(origin, destination, map)
      @origin = origin
      @destination = destination
      @map = map
    end

    def distance
      map.distance(origin, destination)
    end

    attr_reader :origin, :destination, :map
  end
end
