# Abstract Product
  module Chair
    def sit; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end
  end

# Concrete Products
  class IkeaChair
    include Chair

    def sit
      'sitting in an uncomfortable, cheap IKEA chair.'
    end
  end

# Concrete Products
  class WalmartChair
    include Chair

    def sit
      'sitting in an uncomfortable, cheap Walmart chair.'
    end
  end

# Concrete Products
  class NikeChair
    include Chair

    def sit
      'sitting in an uncomfortable, expensive Nike chair.'
    end
  end
