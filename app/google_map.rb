require 'httparty'
require 'json'

class GoogleMap
  def driving_distance origin, destination
    response = Request.new(origin, destination).response
    distance_metric = response['rows'].first['elements'].first['distance']['value']
    distance_metric * 0.000621371
  end

  private
  class Request
    def initialize(origin, destination)
      @origin = origin
      @destination = destination
    end

    def response
      HTTParty.get(url)
    end

    private
    attr_reader :origin, :destination

    def url
      base_url + "?#{origin_params}&#{destination_params}"
    end

    def origin_params
      location_param :origins, origin
    end

    def destination_params
      location_param :destinations, destination
    end

    def location_param label, location
      "#{label}=#{location.latitude},#{location.longitude}"
    end

    def base_url
      "https://maps.googleapis.com/maps/api/distancematrix/json"
    end
  end
end
