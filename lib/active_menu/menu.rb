class ActiveMenu::Menu < ActiveMenu::Node

  def initialize(*args)
    super(*args)
    self.visible = true
  end

end