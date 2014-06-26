require_relative 'route'

class Resolver
  def initialize route_a, route_b, map
    @route_a = route_a
    @route_b = route_b
    @map = map
  end
  attr_reader :route_a, :route_b, :map

  def shortest_route
    possible_routes.min {|a, b| a.distance <=> b.distance }
  end

  private
  def possible_routes
    [route_a, route_b].map { |driver| route_with_driver(driver) }
  end

  def route_with_driver driver
    Route.new([driver.origin,
              other(driver).origin,
              other(driver).destination,
              driver.destination], map)
  end

  def other(route)
    if route == route_a
      route_b
    else
      route_a
    end
  end
end
