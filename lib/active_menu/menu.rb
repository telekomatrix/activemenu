class ActiveMenu::Menu
  
  attr_accessor :id, :submenus, :parent, :options
  
  def initialize(id, options={}, &block)
    @id = id.to_sym
    @options = options
    @submenus = []
    yield(self) if block_given?
  end

  def submenu(id, options={}, &block)
    sm = self.class.new(id, options, &block)
    sm.parent = self
    @submenus << sm
    sm
  end

  def option(key, value=nil)
    if value.nil?
      @options[key]
    else
      value = value.to_sym
      @options[key] = value
    end
  end

  def text(value = nil)
    self.option(:text, value)
  end

  def href(value = nil)
    self.option(:href, value)
  end  

  def tag(value=nil)
    self.option(:tag, value)
  end

end