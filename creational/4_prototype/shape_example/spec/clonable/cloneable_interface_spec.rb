require_relative '../spec_helper'
require_relative '../../lib/cloneable_interface'

RSpec.describe Cloneable do
  let(:cloneable_obj){ class CloneableObj; include Cloneable; end;}

  context '#clone' do
    it 'throws an error when not overwritten' do
      expect{cloneable_obj.clone}.to raise_error.with_message('overwrite me')
    end
  end
end
