#!/usr/bin/env ruby

require_relative 'cloneable_interface'

# Abstract Class
class Shape
  include Cloneable

  def initialize shape=nil
    unless source == nil
      @x = shape.x
      @y = shape.y
      @color = source.color
    end
  end
end

