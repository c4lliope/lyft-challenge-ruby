require_relative 'app/resolver'
require_relative 'app/google_map'
require_relative 'app/helpers'

begin
  invalid_usage unless ARGV.count == 8
  ARGV.each { |arg| invalid_usage unless arg.is_number? }
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
rescue GoogleMap::LocationNotFoundError
  puts "Sorry, we couldn't find a location matching your coordinates"
rescue GoogleMap::APIError
  puts "Hrmm... looks like there's a problem with the API right now. Try again later."
end
