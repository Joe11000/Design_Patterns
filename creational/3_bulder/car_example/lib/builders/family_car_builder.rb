# Builder Interface
require 'active_support/concern'
require_relative 'transmission'
require_relative '../moonroof/moonroof'
require_relative '../car/car'
require 'pry'

# Concrete Builders
class FamilyCarBuilder
  def self.build |builder|
    builder = new
    yield builder
    builder.car
  end

  def initialize(car: Car.new)
    @car = car
  end

  def car
    raise 'Car needs 4 tires' unless @car.tires.length != 4
    raise 'Car needs a transmission' unless @car.tranmission != nil

    @car
  end

  def set_tires tires: Array.new(Wheel.new, 4)
    @car.tires = tires
  end

  def set_transmission transmission: AutomaticTransmission.new
    @transmission = transmission
  end

  def set_moonroof moonroof: Moonroof.new
    @moonroof = moonroof
  end
end
