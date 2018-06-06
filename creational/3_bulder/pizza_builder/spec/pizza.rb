require_relative 'spec_helper'
require_relative '../lib/pizza'

RSspec.describe 'Pizza' do
  context 'an instance of pizza' do

    context 'a default instance' do
      let(:default_pizza) { Pizza.new }

      it 'has the correct defaults' do
        expect(default_pizza.toppings).to eq []
      end

      it '' do
        expect(1).to eq 1
      end
    end
  end
end
