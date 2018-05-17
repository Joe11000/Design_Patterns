require_relative 'spec_helper'
require_relative '../lib/builders'

RSpec::Matchers.define :have_attr_accessor do |field|
  match do |object_instance|
    object_instance.respond_to?(field) &&
      object_instance.respond_to?("#{field}=")
  end

  failure_message_for_should do |object_instance|
    "expected attr_accessor for #{field} on #{object_instance}"
  end

  failure_message_for_should_not do |object_instance|
    "expected attr_accessor for #{field} not to be defined on #{object_instance}"
  end

  description do
    "checks to see if there is an attr accessor on the supplied object"
  end
end

RSpec.shared_examples 'a car without a moonroof' do  |car|
  context "#moonroof?" do
    it "should't be an accessible method" do
      expect{car.moonroof?}.to raise_error NoMethodError
    end
  end
  context "#close_moonroof?" do
    it "should't be an accessible method" do
      expect{car.close_moonroof}.to raise_error NoMethodError
    end
  end
  context "#set_moonroof?" do
    it "should't be an accessible method" do
      expect{car.set_moonroof}.to raise_error NoMethodError
    end
  end
end

RSpec.shared_examples 'a car with a moonroof' do  |car|
  @moonroof_open = percent_open
end

RSpec.describe 'Following Builder Design Pattern' do
  context 'Products being built' do
    context Car do
      subject { described_class.new }

      it { is_expected.to have_attr_accessor(:transmission) }
      it { is_expected.to have_attr_accessor(:moonroof) }
      it { is_expected.to have_attr_accessor(:tires) }
    end

    context '' do
      it_behaves_like 'a car without a moonroof', Car.new
    end
  end
end

