require 'webmock/rspec'
require_relative '../app/google_map'

describe GoogleMap do
  it 'responds to distance queries' do
    stub_response
    pier_39 = double(latitude: 37.808673, longitude: -122.409821)
    lombard = double(latitude: 37.802139 , longitude: -122.41874)

    expect(subject.driving_distance(pier_39, lombard)).to be_within(0.01).of(1.24)
  end

  def stub_response
    stub_request(:get, "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=37.802139,-122.41874&origins=37.808673,-122.409821").
      to_return(:status => [200, 'OK'],
                :headers => {"content-type"=>["application/json; charset=UTF-8"]},
                :body =>
    <<-RESPONSE
{ "destination_addresses" : [ "1041-1047 Lombard Street, San Francisco, CA 94109, USA" ],
  "origin_addresses" : [ "1644-1712 The Embarcadero, San Francisco, CA 94133, USA" ],
  "rows" : [
    { "elements" : [
        { "distance" : { "text" : "2.0 km", "value" : 1997 },
          "duration" : { "text" : "8 mins", "value" : 466 },
          "status" : "OK"
        } ] } ],
  "status" : "OK"
}
    RESPONSE
               )
  end
end
