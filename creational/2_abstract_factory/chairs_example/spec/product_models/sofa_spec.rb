require_relative '../spec_helper'
require_relative '../../lib/product_models/sofa'
require_relative '../shared_examples/shared_examples_spec'


RSpec.describe 'Sofa Interface' do |a|
  let!(:sofa_role){ class SofaRole; include Sofa; end; }

  context '#sit' do
    it 'throws an error if not overwritten' do
      expect { sofa_role.new.sit }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end
end



RSpec.describe IkeaSofa do
  it_behaves_like 'Sofa Role', IkeaSofa.new, $ikea_sofa_message
end

RSpec.describe WalmartSofa do
  it_behaves_like 'Sofa Role', WalmartSofa.new, $walmart_sofa_message
end

RSpec.describe NikeSofa do
  it_behaves_like 'Sofa Role', NikeSofa.new, $nike_sofa_message
end
