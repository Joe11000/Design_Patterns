# Abstract Product
  module Sofa
    def sit; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end
  end

# Concrete Products
  class IkeaSofa
    include Sofa

    def sit
      'sitting in an uncomfortable, cheap IKEA sofa.'
    end
  end

  class WalmartSofa
    include Sofa

    def sit
      'sitting in an uncomfortable, cheap Walmart sofa.'
    end
  end

  class NikeSofa
    include Sofa

    def sit
      'sitting in an uncomfortable, expensive Nike sofa.'
    end
  end
