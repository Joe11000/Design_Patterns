#!/usr/bin/env ruby

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

class Pizza
  attr_accessor :toppings, :sauce, :diameter, :price
  def initialize
    @toppings = []
  end

  def to_s
    "A #{diameter}\" pizza with #{sauce} sauce and #{toppings.map(&:to_s).join(', ')} for toppings \n" + \
    "Price : #{price}"
  end
end


class Sauce
  def price; end;
end

class Marinara < Sauce
  def price
    1.00
  end

  def to_s
    'Marinara'
  end
end

class BBQ < Sauce
  def price
    1.50
  end

  def to_s
    'BBQ'
  end
end


class Topping
  def price; end;
end

class Sausage < Topping
  def price
    1.00
  end

  def to_s
    'Sausage'
  end
end

class GreenPepper < Topping
  def price
    0.50
  end

  def to_s
    "Green Pepper"
  end
end


# Restaurant Simulator

STDOUT.sync = true

# Simulate_multiple
order_queue = Queue.new
work_hours = true
mutex = Mutex.new
# cv = ConditionVariable.new

customers_orders = Thread.new do
  Thread.current[:orders_received] = 0
  for i in 1..10 do
    sleep 0.25
    order_queue << PizzaBuilder.build do |pizza_builder|
      pizza_builder.set_diameter rand(5..18)
      pizza_builder.add_topping [Sausage, GreenPepper].sample.new
      pizza_builder.add_sauce [Marinara, BBQ].sample.new
    end
    Thread.current[:orders_received] += 1
  end
  mutex.synchronize do
    work_hours = false
  end
end

workers = Thread.new do
  Thread.current[:earnings] = 0.0
  Thread.current[:pizzas_made] = 0

  while work_hours || !order_queue.empty?
    sleep 0.5
    unless order_queue.empty?
      earned = order_queue.pop.price
      Thread.current[:earnings] += earned
      Thread.current[:pizzas_made] += 1
      puts "receipt ##{Thread.current[:pizzas_made]}: $#{earned}"
    end
  end
  puts "\n-- Closed For The Day --"
end

customers_orders.join
workers.join

puts "\nPizza's made: #{workers[:pizzas_made]}"
puts "Earned: #{workers[:earnings]}"
