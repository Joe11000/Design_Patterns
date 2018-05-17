class Moonroof
  attr_reader :status

  def initialize percent_open=0
    @moonroof_open = percent_open
  end

  def open!
    @status = 'open'
  end

  def close!
    @status = 'closed'
  end
end
