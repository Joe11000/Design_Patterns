require_relative 'interface'

class AutomaticTransmission
  include Transmission

  def change_speed speed; @speed = speed; end;
end
