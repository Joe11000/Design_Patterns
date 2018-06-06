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
