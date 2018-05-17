# Abstract Product
  module CoffeeTable
    def set; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end
  end

# Concrete Products
  class IkeaCoffeeTable
    include CoffeeTable

    def set
      'setting objects on a cheap IKEA coffee table.'
    end
  end

  class WalmartCoffeeTable
    include CoffeeTable

    def set
      'setting objects on a cheap Walmart coffee table.'
    end
  end

  class NikeCoffeeTable
    include CoffeeTable

    def set
      'setting objects on a expensive Nike coffee table.'
    end
  end
