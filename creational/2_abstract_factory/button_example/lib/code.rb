# Abstract Factory pattern

  # Also, you do not want to change existing code when adding new products or families of products to the program. Furniture vendors update their catalogs very often, and you do not want to change the core code each time it happens.
module Button
  def click; raise(NotImplementedError, 'Needs to override useful'); end
end
# Product Family
class WindowsButton
  include Button

  def click
    "Clicked a Windows style button"
  end
end
class MacButton
  include Button

  def click
    "Clicked a Mac style button"
  end
end
# Product Family


module Checkbox
  def check; raise(NotImplementedError, 'Needs to override useful'); end
  def uncheck; raise(NotImplementedError, 'Needs to override useful'); end
end
 # Product Family
class WindowsCheckbox
  include Checkbox

  def check
    "Checked a Windows style checkbox"
  end

  def uncheck
    "Unchecked a Windows style checkbox"
  end
end
class MacCheckbox
  include Checkbox

  def check
    "Checked a Mac style checkbox"
  end

  def uncheck
    "Unchecked a Mac style checkbox"
  end
end
 # Product Family*/



module GUIFactory
  def createButton; end;
  def createCheckbox; end;
end
class MacFactory
  include GUIFactory

  def createButton
    MacButton.new
  end

  def createCheckbox
    MacCheckbox.new
  end
end
class WindowsFactory
  include GUIFactory

  def createButton
    WindowsButton.new
  end

  def createCheckbox
    WindowsCheckbox.new
  end
end



class Application
  def initialize(factory:)
    @factory = factory
  end

  def createButton
    @button ||= factory.createButton
  end
  def click_button
    button.click
  end

  def createCheckbox
    @checkbox ||= factory.createCheckbox
  end
  def click_checkbox
    checkbox.click
  end

  private
    attr_reader :button, :factory, :checkbox
end




class ApplicationConfigurator
  def main operating_system
    if(operating_system == "Windows")
      factory = WindowsFactory.new
    elsif operating_system == 'Mac'
      factory = MacFactory.new
    else
      raise "Error! unknown operating system"
    end

    Application.new factory: factory
  end
end




# Step 1: Go over all distinct products and force their variants to follow common interfaces ie all chair variants follow Chair Interfaces
