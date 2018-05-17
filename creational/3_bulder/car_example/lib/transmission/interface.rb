module Transmission
  attr_reader :speed

  def change_speed speed; raise NotImplementedError; end
end
