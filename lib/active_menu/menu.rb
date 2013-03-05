class ActiveMenu::Menu < ActiveMenu::Node

  def text(value = nil)
    self.option(:text, value)
  end

  def href(value = nil)
    self.option(:href, value)
  end  

end