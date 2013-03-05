class ActiveMenu::Menu < ActiveMenu::Node

  def initialize(*args)
    super(*args)
    self.visible true
  end


  def text(value=nil)
    self.option(:text, value)
  end

  def href(value=nil)
    self.option(:href, value)
  end  

  def visible(value=nil)
    self.option(:visible, value)
  end

end