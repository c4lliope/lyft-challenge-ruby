require 'webmock/rspec'
require_relative '../app/google_map'

describe GoogleMap do
  it 'responds to distance queries' do
    FakeGoogleMapServer.stub_distance_response 1997
    pier_39 = double(latitude: 37.808673, longitude: -122.409821)
    lombard = double(latitude: 37.802139 , longitude: -122.41874)

    expect(subject.driving_distance(pier_39, lombard)).to eq 1997
  end
end

module FakeGoogleMapServer
  extend WebMock::API
  extend WebMock::Matchers

  def self.stub_distance_response(distance_in_meters)
    stub_request(:get, /maps.googleapis.com\/maps\/api\/distancematrix\/json/).
      to_return(
        :status => [200, 'OK'],
        :headers => {"content-type"=>["application/json; charset=UTF-8"]},
        :body =>
    <<-RESPONSE
{ "destination_addresses" : [ "Destination Address" ],
  "origin_addresses" : [ "Origin Address" ],
  "rows" : [
    { "elements" : [
        { "distance" : { "text" : "2.0 km", "value" : #{distance_in_meters} },
          "duration" : { "text" : "8 mins", "value" : 466 },
          "status" : "OK"
        } ] } ],
  "status" : "OK"
}
    RESPONSE
    )
  end
end
