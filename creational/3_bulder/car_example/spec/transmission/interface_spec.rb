require_relative '../../lib/transmission/interface'

RSpec.describe 'Transmission Interface' do
  let(:transmission){ class T; include Transmission; end; }
  let(:transmission_obj){ transmission.new }

  context '#change_speed' do
    it 'is an empty speed attr_reader' do
      expect{transmission_obj.change_speed(rand(60))}.to raise_error NotImplementedError
    end
  end

  context '#speed' do
    it 'is an empty speed attr_reader' do
      expect(transmission_obj.speed).to eq nil
    end
  end
end
