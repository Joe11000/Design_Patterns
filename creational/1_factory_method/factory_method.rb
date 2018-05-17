#!/usr/bin/env ruby -w

# product interface
module Transport
  def deliver point_a, point_b; end;
end

# concrete product Boat
class Boat
  include Transport

  def deliver point_a, point_b
    "go across WATER from #{point_a} to #{point_b}"
  end
end;

# concrete Product Truck
class Truck
  include Transport

  def deliver point_a, point_b
    "go across LAND from #{point_a} to #{point_b}"
  end
end;


# creater
class Logistics
  attr_reader :point_a, :point_b

  def initialize point_a:, point_b:
    @point_a, @point_b = point_a, point_b
  end

  def deliver
    createTransport.deliver point_a, point_b
  end

  def createTransport; raise 'override this method in a subclass'; end;
end

# concrete creator
class TruckLogistics < Logistics
  def initialize point_a:, point_b:
    super(point_a: point_a, point_b: point_b)
  end

  def createTransport
    Truck.new
  end
end

# concrete creator
class BoatLogistics < Logistics
  def initialize point_a:, point_b:
    super(point_a: point_a, point_b: point_b)
  end

  def createTransport
    Boat.new
  end
end





require 'rspec/autorun'

describe 'TruckLogistics' do
  let(:outbound_truck) { TruckLogistics.new(point_a: 'dads', point_b: 'chicago') }

  context '#deliver' do
    it 'can deliver from one place to another' do
      expect(outbound_truck.deliver).to eq 'go across LAND from dads to chicago'
    end
  end

  context '#point_a' do
    it 'knows its starting location' do
      expect(outbound_truck.point_a).to eq 'dads'
    end
  end
  context '#point_b' do
    it 'knows its ending location' do
      expect(outbound_truck.point_b).to eq 'chicago'
    end
  end
end

describe 'BoatLogistics' do
  let(:outbound_truck) { BoatLogistics.new(point_a: 'navy pier', point_b: 'michigan') }

  context '#deliver' do
    it 'can deliver from one place to another' do
      expect(outbound_truck.deliver).to eq 'go across WATER from navy pier to michigan'
    end
  end
  context '#point_a' do
    it 'knows its starting location' do
      expect(outbound_truck.point_a).to eq 'navy pier'
    end
  end
  context '#point_b' do
    it 'knows its ending location' do
      expect(outbound_truck.point_b).to eq 'michigan'
    end
  end
end
