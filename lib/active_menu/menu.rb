class ActiveMenu::Menu
  
  attr_accessor :id, :href, :content, :submenus, :parent
  
  def initialize(id, href = nil, content=nil, submenus=[], parent=nil, &block)
    @id = id.to_sym
    @href = href
    @submenus = []
    @content = content

    #sets the parent
    submenus.each {|s| s.parent = self }
    @submenus = submenus
    @parent = parent
    yield(self) if block_given?
  end

  def submenu(id, href, content=nil, submenus=[], &block)
    sm = self.class.new(id, href, content, submenus, self, &block)
    @submenus << sm
    sm
  end

end