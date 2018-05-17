class Government
  @@instance = Government.new

  private_class_method :new

  def self.instance
    @@instance
  end
end
