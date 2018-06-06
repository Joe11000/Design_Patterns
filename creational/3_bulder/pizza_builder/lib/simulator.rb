require_relative 'pizza_builder'
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
