require_relative '../lib/code'
require_relative 'spec_helper'
require 'pry'

RSpec.shared_examples 'Button' do
  context '#click' do
    let(:button_role){ class ButtonRole; include Button; end  }

    it 'throws an error if not overwritten' do
      expect{ button_role.new.click }.to raise_error NotImplementedError
    end

    it 'throws an error if not overwritten' do
      expect{ described_class.new.click }.to_not raise_error NotImplementedError
    end
  end
end

RSpec.describe WindowsButton do
  it_behaves_like 'Button'
end

RSpec.describe MacButton do
  it_behaves_like 'Button'
end





RSpec.describe 'ApplicationConfigurator' do
  let!(:app_configurer) { ApplicationConfigurator.new }

  context 'Windows' do
    let!(:os_type) { 'Windows'}

    context 'Button' do
      it '#click' do
        expect(app_configurer.main(os_type).createButton.click).to eq 'Clicked a Windows style button'
      end
    end

    context 'Checkbox' do
      it '#check' do
        expect(app_configurer.main(os_type).createCheckbox.check).to eq 'Checked a Windows style checkbox'
      end

      it '#uncheck' do
        expect(app_configurer.main(os_type).createCheckbox.uncheck).to eq 'Unchecked a Windows style checkbox'
      end
    end
  end

  context 'Mac' do
    let!(:os_type) { 'Mac'}

    context 'Button' do
      it '#click' do
        expect(app_configurer.main(os_type).createButton.click).to eq 'Clicked a Mac style button'
      end
    end

    context 'Checkbox' do
      it '#check' do
        expect(app_configurer.main(os_type).createCheckbox.check).to eq 'Checked a Mac style checkbox'
      end

      it '#uncheck' do
        expect(app_configurer.main(os_type).createCheckbox.uncheck).to eq 'Unchecked a Mac style checkbox'
      end
    end
  end

  context 'Invalid OS' do
    let!(:os_type) { 'Invalid_OS' * 3 }

    context 'Button' do
      it 'raises ' do
        expect{app_configurer.main(os_type).createButton.click}.to raise_error "Error! unknown operating system"
      end
    end

    context 'Checkbox' do
      it '#' do
        expect{app_configurer.main(os_type).createCheckbox}.to raise_error "Error! unknown operating system"
      end
    end
  end
end
