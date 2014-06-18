class Location
  def initialize latitude, longitude, name=''
    @latitude = latitude
    @longitude = longitude
    @name = name
  end

  attr_reader :latitude, :longitude, :name
end
