# # Concrete Builders
# class FamilyCarBuilder
#   def self.build
#   end
# end

car = FamilyCarBuilder.new.build do |builder|
  builder.set_tires
  builder.set_transmission
  builder.set_moonroof
end

builder.car
