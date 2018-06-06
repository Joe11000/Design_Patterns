#!/usr/bin/env ruby
require_relative 'pizza'
require_relative 'topping'
require_relative 'sauce'

class PizzaBuilder
  def initialize pizza=Pizza.new
    @pizza = pizza
  end

  def self.build
    builder = new
    yield builder
    builder.result
  end

  def result
    raise 'Please enter a valid Sauce' unless @pizza.sauce.is_a? Sauce
    raise 'Please enter a valid Topping' if @pizza.toppings.size > 0 && @pizza.toppings.any?{|s| !s.is_a?(Topping) }
    raise 'Please enter a valid Diameter' unless @pizza.diameter.is_a? Numeric
    @pizza.price ||= calculate_price
    raise 'Price is invalid' unless @pizza.price.is_a? Numeric
    @pizza
  end

  def set_diameter diameter
    @pizza.diameter = diameter
  end

  def add_sauce sauce
    @pizza.sauce = sauce
  end

  def add_topping topping
    @pizza.toppings.append topping
  end

  private

  def calculate_price
    (price_for_size @pizza.diameter) + \
    (@pizza.toppings.inject(0) {|sum, topping| sum += topping.price }) + \
    @pizza.sauce.price
  end

  def price_for_size price
    case price
      when 0...9
        5.00
      when 9...12
        8.50
      when 12...15
        10.00
      else
        15.10
    end
  end
end
