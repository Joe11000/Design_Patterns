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
