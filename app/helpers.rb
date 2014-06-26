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

def display_usage
  puts <<-END_USAGE
Description:
  Calculate the detour distance between two different rides. Given four
  latitude / longitude pairs, where driver one is traveling from point A to
  point B and driver two is traveling from point C to point D, this program
  calculates the shorter of the detour distances the drivers would need to take
  to pick-up and drop-off the other driver.

Usage:
  ruby rideshare_resolver.rb lat_1a long_1a lat_1b long_1b lat2a long2a lat2b long2b

  The numbers 1 and 2 represent the drivers, while letters a and b represent the
  origin and destination of each route. The input numbers should be grouped by
  latitude/longitude pairs, then by routes start to finish.
  END_USAGE
end

def invalid_usage
  puts "Invalid usage."
  puts
  display_usage
  exit
end

class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end
