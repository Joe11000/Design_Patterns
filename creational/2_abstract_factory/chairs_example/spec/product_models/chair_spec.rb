require_relative '../spec_helper'
require_relative '../shared_examples/shared_examples_spec'
require_relative '../../lib/product_models/chair'
require 'pry'

RSpec.describe 'Chair Interface' do
  let!(:chair_role){ class ChairRole; include Chair; end; }

  context '#sit' do
    it 'throws an error if not overwritten' do
      expect { chair_role.new.sit }.to raise_error(NotImplementedError).with_message('Must Overwrite Abstract Method')
    end
  end
end

RSpec.describe IkeaChair do
  it_behaves_like 'Chair Role', IkeaChair.new, $ikea_chair_message
end

RSpec.describe WalmartChair do
  it_behaves_like 'Chair Role', WalmartChair.new, $walmart_chair_message
end

RSpec.shared_examples NikeChair do
  it_behaves_like 'Chair Role', NikeChair.new, $nike_chair_message
end
