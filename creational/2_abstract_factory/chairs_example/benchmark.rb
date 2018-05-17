#!/usr/bin/env ruby
require_relative 'lib/application/application_configuror'
require 'benchmark'
require 'rspec/autorun'

Benchmark.bmbm(20)  do |bmbm|
  bmbm.report('IkeaChair'){ 100.times { ApplicationConfiguror.new(brand_factory: :ikea).app.createChair.sit} }
  bmbm.report('IkeaCoffeeTable'){ 100.times { ApplicationConfiguror.new(brand_factory: :ikea).app.createCoffeeTable.set} }
  bmbm.report('IkeaSofa'){ 100.times { ApplicationConfiguror.new(brand_factory: :ikea).app.createSofa.sit} }

  bmbm.report('WalmartChair'){ 100.times { ApplicationConfiguror.new(brand_factory: :walmart).app.createChair.sit} }
  bmbm.report('WalmartCoffeeTable'){ 100.times { ApplicationConfiguror.new(brand_factory: :walmart).app.createCoffeeTable.set} }
  bmbm.report('WalmartSofa'){ 100.times { ApplicationConfiguror.new(brand_factory: :walmart).app.createSofa.sit} }

  bmbm.report('NikeChair'){ 100.times { ApplicationConfiguror.new(brand_factory: :nike).app.createChair.sit} }
  bmbm.report('NikeCoffeeTable'){ 100.times { ApplicationConfiguror.new(brand_factory: :nike).app.createCoffeeTable.set} }
  bmbm.report('NikeSofa'){ 100.times { ApplicationConfiguror.new(brand_factory: :nike).app.createSofa.sit} }
end
