require_relative 'interface'

# interface to play the Transmission role
class ManualTransmission
  include Transmission
  attr_reader :gear

  def initialize; @gear = 0; end

  def change_speed speed; shift_to_gear( figure_out_gear(speed) ); @speed = speed; end;

  private
    def figure_out_gear speed; rand(1..6); end;
    def shift_to_gear gear; @gear = gear; end;
end


