require_relative '../app/resolver'

describe Resolver do
  let(:pier_39) { Location.new(37.808673, -122.409821, 'Pier 39') }
  let(:lombard) { Location.new(37.802139 , -122.41874, 'Lombard St') }
  let(:sutro) { Location.new(37.777794 , -122.511107, 'Sutro Heights Park') }

  let(:map) { FakeMap.new }

  it 'takes two routes and calculates the shortest path' do
    route_a = Route.new [pier_39, lombard], map
    route_b = Route.new [sutro, lombard], map

    map.stub_distance sutro, lombard, 5
    map.stub_distance sutro, pier_39, 4
    map.stub_distance pier_39, sutro, 4
    map.stub_distance pier_39, lombard, 1

    resolver = Resolver.new(route_a, route_b, map)
    expect(resolver.shortest_route).to eq Route.new([sutro, pier_39, lombard, lombard], map)
  end
end

class FakeMap
  def initialize
    @distances = {}
  end

  def stub_distance origin, destination, distance
    @distances[[origin, destination]] = distance
  end

  def distance origin, destination
    return 0 if origin == destination
    @distances[[origin, destination]] ||
      throw("Distance was not stubbed: #{origin} to #{destination}")
  end
end
