# Builder Interface
require 'active_support/concern'
require_relative 'interfaces/car'
require_relative 'transmission'
require_relative '../moonroof/moonroof'
require_relative '../car/car'
require 'pry'

# Concrete Builders
class SportsCarBuilder
  def self.build |builder|
    builder = new
    yield builder
    builder.car
  end

  def initialize(car: Car.new)
    @car = car
  end

  def car
    raise 'Car needs 4 tires' if @car.tires.length != 4
    raise 'Car needs a transmission' if @car.tranmission == nil

    @car
  end

  def set_tires tires=Array.new(Wheel.new, 4)
    @car.tires = tires
  end

  def set_transmission transmission=ManualTransmission.new
    @transmission = transmission
  end
end
