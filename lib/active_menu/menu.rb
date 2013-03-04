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

  def text(value = nil)
    if value.nil?
      @options[:text]
    else
      value = value.to_sym
      @options[:text] = value
    end
  end

  def text=(value)
    self.text(value)
  end

  def href(value = nil)
    if value.nil?
      @options[:href]
    else
      value = value.to_sym
      @options[:href] = value
    end
  end

  def href=(value)
    self.href(value)
  end
  

  def tag(value=nil)
    if value.nil?
      @options[:tag]
    else
      value = value.to_sym
      @options[:tag] = value
    end
  end

end