require_relative '../app/location'

describe Location do
  it 'is defined by latitude and longitude' do
    pier_39 = Location.new 37.808673, -122.409821, "Pier 39"

    expect(pier_39.latitude).to eq(37.808673)
    expect(pier_39.longitude).to eq(-122.409821)
  end
end
