class Location
  def initialize latitude, longitude, name=''
    @latitude = latitude
    @longitude = longitude
    @name = name
  end

  attr_reader :latitude, :longitude, :name
  alias to_s name
end
