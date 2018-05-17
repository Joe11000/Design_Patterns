require_relative '../spec_helper'
require_relative '../../lib/application/application'
require_relative '../abstract_factories/brand_factory_spec'
require_relative '../shared_examples/shared_examples_spec'

RSpec.describe 'Application' do

  context 'IkeaFactory' do
    it_behaves_like 'BrandFactory Role', Application.new(factory: IkeaFactory.new)
  end
  context 'NikeFactory' do
    it_behaves_like 'BrandFactory Role', Application.new(factory: NikeFactory.new)
  end
  context 'WalmartFactory' do
    it_behaves_like 'BrandFactory Role', Application.new(factory: WalmartFactory.new)
  end
end
