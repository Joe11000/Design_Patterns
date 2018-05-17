require_relative '../spec_helper'
require_relative '../../lib/application/application_configuror'
require_relative '../../spec/product_models/chair_spec'

RSpec.describe 'ApplicationConfiguror' do
  context '#app' do
    context 'with a valid factory parameter'do
      context 'with a Ikea Factory parameter' do
        it_behaves_like 'BrandFactory Role', ApplicationConfiguror.new(brand_factory: :ikea).app

        context do
          it_behaves_like 'Chair Role', ApplicationConfiguror.new(brand_factory: :ikea).app.createChair, $ikea_chair_message
          it_behaves_like 'CoffeeTable Role', ApplicationConfiguror.new(brand_factory: :ikea).app.createCoffeeTable, $ikea_coffee_table_message
          it_behaves_like 'Sofa Role', ApplicationConfiguror.new(brand_factory: :ikea).app.createSofa, $ikea_sofa_message
        end
      end

      context 'with a Nike Factory parameter' do
        it_behaves_like 'BrandFactory Role', ApplicationConfiguror.new(brand_factory: :nike).app

        context do
          it_behaves_like 'Chair Role', ApplicationConfiguror.new(brand_factory: :nike).app.createChair, $nike_chair_message
          it_behaves_like 'CoffeeTable Role', ApplicationConfiguror.new(brand_factory: :nike).app.createCoffeeTable, $nike_coffee_table_message
          it_behaves_like 'Sofa Role', ApplicationConfiguror.new(brand_factory: :nike).app.createSofa, $nike_sofa_message
        end
      end

      context 'with a Walmart Factory parameter' do
        it_behaves_like 'BrandFactory Role', ApplicationConfiguror.new(brand_factory: :walmart).app

        context do
          it_behaves_like 'Chair Role', ApplicationConfiguror.new(brand_factory: :walmart).app.createChair, $walmart_chair_message
          it_behaves_like 'CoffeeTable Role', ApplicationConfiguror.new(brand_factory: :walmart).app.createCoffeeTable, $walmart_coffee_table_message
          it_behaves_like 'Sofa Role', ApplicationConfiguror.new(brand_factory: :walmart).app.createSofa, $walmart_sofa_message
        end
      end
    end

    context 'with an invalid factory parameter'do
      it 'raises an error' do
        invalid_brand = '123' * 4

        expect{ApplicationConfiguror.new(brand_factory: invalid_brand) }.to  raise_error.with_message("Invalid Factory for #{invalid_brand}")
      end
    end
  end
end
