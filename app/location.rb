class Location
  def initialize latitude, longitude
    @latitude = latitude
    @longitude = longitude
  end

  attr_reader :latitude, :longitude
end
