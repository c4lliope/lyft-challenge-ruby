class Location
  def initialize latitude, longitude, name=''
    @latitude = latitude
    @longitude = longitude
    @name = name
  end

  attr_reader :latitude, :longitude, :name

  def to_s
    name
  end

  def coordinate_string
    "(#{latitude},#{longitude})"
  end
end
