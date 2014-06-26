require_relative 'app/resolver'
require_relative 'app/google_map'

def display_routes routes
  puts
  routes.each_with_index do |route, index|
    puts "Driver #{index+1}:"
    route.locations.each do |location|
      puts "  #{location.name} #{location.coordinate_string}"
    end
  end
  puts
end

begin
  map = GoogleMap.new

  routes = ARGV.each_slice(4).each_with_index.map do |route_coords, route_index|
    locations = route_coords.each_slice(2).each_with_index.map do |location_coords, index|
      location_index = route_index * 2 + index
      Location.new location_coords.first, location_coords.last, %w{A B C D}[location_index]
    end
    Route.new locations, map
  end

  display_routes routes

  resolver = Resolver.new routes.first, routes.last, map
  puts "Calculating shortest route..."
  route = resolver.shortest_route

  puts "The shortest route possible with one driver picking up another is #{route.to_s}"
end
