require_relative '../spec_helper'

RSpec.shared_examples 'Chair Role' do |klass_obj, resulting_message|
  context '#sit' do
    it 'tells you about the experience' do
      expect(klass_obj.sit).to eq resulting_message
    end
  end
end

RSpec.shared_examples 'CoffeeTable Role' do |klass_obj, resulting_message|
  context '#set' do
    it 'tells you about the experience' do
      expect(klass_obj.set).to eq resulting_message
    end
  end
end


RSpec.shared_examples 'Sofa Role' do |klass_obj, resulting_message|
  context '#sit' do
    it 'tells you about the experience' do
      expect(klass_obj.sit).to eq resulting_message
    end
  end
end


RSpec.shared_examples 'BrandFactory Role' do |klass_obj|
  it '#createChair' do
    expect{klass_obj.createChair}.not_to raise_error
  end

  it '#createSofa' do
    expect{klass_obj.createSofa}.not_to raise_error
  end

  it '#createCoffeeTable' do
    expect{klass_obj.createCoffeeTable}.not_to raise_error
  end
end
