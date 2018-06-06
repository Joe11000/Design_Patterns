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
