require_relative 'application'

class ApplicationConfiguror
  attr_reader :app

  def initialize(brand_factory:)
    case brand_factory
    when :nike
      factory = ::NikeFactory.new
    when :ikea
      factory = ::IkeaFactory.new
    when :walmart
      factory = ::WalmartFactory.new
    else
      raise "Invalid Factory for #{brand_factory}"
    end

    @app = Application.new(factory: factory)
  end
end
