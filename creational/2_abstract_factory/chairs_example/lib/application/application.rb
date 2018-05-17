require_relative '../abstract_factories/brand_factory'
require 'forwardable'

class Application
  extend Forwardable

  def initialize(factory:)
    @factory = factory
  end

  BrandFactory.instance_methods(false).each do |overriding_method|
    def_delegators :@factory, overriding_method.to_sym
  end

  private
    attr_reader :factory
end



