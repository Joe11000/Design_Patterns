#!/usr/bin/env ruby

class Animal
  def eat; end;
  def sleep; end;
  def rave; end;
end

class Frog < Animal
  def eat; puts "Frog eats flies"; self; end;
  def sleep; puts "Frog sleeps near the pond"; self; end;
  def rave; puts "Frog prepares his firefly glow sticks"; self; end;
end

class Plant
  def grow; end;
end

class LilyPad < Plant
  def grow
    puts "LilyPad grows"
  end
end

class SwampFactory
  def createAnimal
    Frog.new
  end

  def createPlant
    LilyPad.new
  end
end

class Habitat
  attr_reader :plants, :animals, :length_of_day

  def initialize(factory:, num_of_plants:, num_of_animals:, length_of_day: )
    @plants = Array.new(num_of_plants, factory.createPlant)
    @animals = Array.new(num_of_animals, factory.createAnimal)
    @length_of_day = length_of_day
  end

  def simulate_day
    plants.each do |plant|
      plant.grow
    end

    animals.each do |animal|
      animal.eat.sleep.rave
    end
  end
end


Habitat.new(factory: SwampFactory.new, num_of_plants: 3, num_of_animals: 4, length_of_day: rand(2..10) )


