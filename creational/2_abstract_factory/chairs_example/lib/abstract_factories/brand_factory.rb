require_relative '../product_models/chair'
require_relative '../product_models/coffee_table'
require_relative '../product_models/sofa'

# Abstract Factory
module BrandFactory
  def createChair; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end;
  def createCoffeeTable; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end
  def createSofa; raise NotImplementedError, 'Must Overwrite Abstract Method' ; end
end

# Concrete Factory
class IkeaFactory
  include BrandFactory

  def createChair; IkeaChair.new; end
  def createCoffeeTable; IkeaCoffeeTable.new; end
  def createSofa; IkeaSofa.new; end
end

# Concrete Factory
class NikeFactory
  include BrandFactory

  def createChair; NikeChair.new; end
  def createCoffeeTable; NikeCoffeeTable.new; end
  def createSofa; NikeSofa.new; end
end

# Concrete Factory
class WalmartFactory
  include BrandFactory

  def createChair; WalmartChair.new; end
  def createCoffeeTable; WalmartCoffeeTable.new; end
  def createSofa; WalmartSofa.new; end
end
