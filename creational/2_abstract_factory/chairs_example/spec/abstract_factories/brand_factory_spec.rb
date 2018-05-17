require_relative '../spec_helper'
require_relative '../shared_examples/shared_examples_spec'
require_relative '../../lib/abstract_factories/brand_factory'

RSpec.describe 'BrandFactory interface' do
  let!(:brand_factory_roll){ class BrandFactoryRoll; include BrandFactory; end; }

  context '#createChair' do
    it 'throws an error if not overwritten' do
      expect { brand_factory_roll.new.createChair }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end

  context '#createCoffeeTable' do
    it 'throws an error if not overwritten' do
      expect { brand_factory_roll.new.createCoffeeTable }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end

  context '#createSofa' do
    it 'throws an error if not overwritten' do
      expect { brand_factory_roll.new.createSofa }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end
end



RSpec.describe 'IkeaFactory' do
  it_behaves_like 'BrandFactory Role', IkeaFactory.new

  it_behaves_like 'Chair Role', IkeaFactory.new.createChair, $ikea_chair_message
  it_behaves_like 'CoffeeTable Role', IkeaFactory.new.createCoffeeTable, $ikea_coffee_table_message
  it_behaves_like 'Sofa Role', IkeaFactory.new.createSofa, $ikea_sofa_message
end

RSpec.describe 'NikeFactory' do
  it_behaves_like 'BrandFactory Role', NikeFactory.new

  it_behaves_like 'Chair Role', NikeFactory.new.createChair, $nike_chair_message
  it_behaves_like 'CoffeeTable Role', NikeFactory.new.createCoffeeTable, $nike_coffee_table_message
  it_behaves_like 'Sofa Role', NikeFactory.new.createSofa, $nike_sofa_message
end

RSpec.describe 'WalmartFactory' do
  it_behaves_like 'BrandFactory Role', WalmartFactory.new
  it_behaves_like 'Chair Role', WalmartFactory.new.createChair, $walmart_chair_message
  it_behaves_like 'CoffeeTable Role', WalmartFactory.new.createCoffeeTable, $walmart_coffee_table_message
  it_behaves_like 'Sofa Role', WalmartFactory.new.createSofa, $walmart_sofa_message
end
