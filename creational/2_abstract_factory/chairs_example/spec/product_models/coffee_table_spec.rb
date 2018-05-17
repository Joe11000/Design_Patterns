require_relative '../spec_helper'
require_relative '../../lib/product_models/coffee_table'
require_relative '../shared_examples/shared_examples_spec'


RSpec.shared_examples 'CoffeeTable' do |a|
  let!(:coffee_table_role){ class CoffeeTableRole; include CoffeeTable; end; }

  context '#set' do
    it 'throws an error if not overwritten' do
      expect { coffee_table_role.new.set }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end
end




RSpec.describe IkeaCoffeeTable do
  it_behaves_like 'CoffeeTable Role', IkeaCoffeeTable.new, $ikea_coffee_table_message
end

RSpec.describe WalmartCoffeeTable do
  it_behaves_like 'CoffeeTable Role', WalmartCoffeeTable.new, $walmart_coffee_table_message
end

RSpec.describe NikeCoffeeTable do
  it_behaves_like 'CoffeeTable Role', NikeCoffeeTable.new, $nike_coffee_table_message
end

