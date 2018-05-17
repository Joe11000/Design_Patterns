#!/usr/bin/env ruby -w
require 'pry'

module Button
  def render; raise 'overwrite #render method'; end;
  def onClick; raise 'overwrite #onClick method'; end;
end

class WindowsButton
  include Button

  def onClick
    'Bound a Windows Event to message'
  end

  def render
    'Windows message says hello'
  end
end

class MacButton
  include Button

  def onClick
    'Bound a Mac Event to message'
  end
  def render
    'Mac message says hello'
  end
end


class Computer
  def renderWindow
    button = createButton
    button.render
    button.onClick
    "#{self.class} button on screen with an event listener attached"
  end

  def createButton; raise 'need a button to press'; end;
end

class MacComputer < Computer
  def createButton
    MacButton.new
  end
end

class WindowsComputer < Computer
  def createButton
    WindowsButton.new
  end
end


require 'rspec/autorun'

describe 'Products' do
  describe Button do
    let(:sample_button) { class ConcreteProductButton; include Button; end;}

    context '#render' do
      it 'throws an error if not overwritten' do
        expect{sample_button.new.render}.to raise_error.with_message('overwrite #render method')
      end
    end

    context '#onClick' do
      it 'throws an error if not overwritten' do
        expect{sample_button.new.onClick}.to raise_error.with_message('overwrite #onClick method')
      end
    end
  end

  describe 'Concrete Products' do
    shared_examples 'A Concrete Product' do |onClick, render_message|
      context '#render' do
        it 'returns message text' do
          expect(described_class.new.render).to eq 'Windows message says hello'
        end
      end
      context '#onClick' do
        it 'returns status that event listener was attached' do
          expect(described_class.new.onClick).to eq 'Bound a Windows Event to message'
        end
      end
    end

    describe WindowsButton do
      it_behaves_like 'A Concrete Product', 'Windows message says hello', 'Bound a Windows Event to message'
    end

    describe MacButton do
      it_behaves_like 'A Concrete Product', 'Mac message says hello', 'Bound a Mac Event to message'
    end
  end
end

describe 'Creator class' do
  context Computer do
    context '#createButton' do

    end
  end

  describe 'Creator Class' do
    context Computer do
      context '#createButton' do
        it 'throws an error if not overwritten' do
          expect{described_class.new.createButton()}.to raise_error.with_message 'need a button to press'
        end
      end
    end
  end

  describe 'Concrete Creators' do
    shared_examples 'A Concrete Creator' do  |button_type, message|
      context '#renderWindow' do
        it 'throws an error if not overwritten' do
          expect(described_class.new.renderWindow).to eq message
        end
      end

      context '#createButton' do
        it 'returns a mac button' do
          expect(described_class.new.createButton()).to be_a button_type
        end
      end
    end

    context MacComputer do
      it_behaves_like 'A Concrete Creator', MacButton, "MacComputer button on screen with an event listener attached"
    end

    context WindowsComputer do
      it_behaves_like 'A Concrete Creator', WindowsButton, "WindowsComputer button on screen with an event listener attached"
    end
  end
end
