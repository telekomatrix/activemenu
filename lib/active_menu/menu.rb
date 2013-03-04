class ActiveMenu::Menu
  
  attr_accessor :id, :href, :content, :submenus, :parent, :options
  
  def initialize(id, href = nil, content=nil, options={}, &block)
    @id = id.to_sym
    @href = href
    @content = content
    @submenus = []
    @options = options

    #sets the parent
    submenus.each {|s| s.parent = self }
    @submenus = submenus
    yield(self) if block_given?
  end

  def submenu(id, href, content=nil, options={}, &block)
    sm = self.class.new(id, href, content, options, &block)
    sm.parent = self
    @submenus << sm
    sm
  end

  def tag(tag_name=nil)
    if tag_name.nil?
      @options[:tag]
    else
      tag_name = tag_name.to_sym
      @options[:tag] = tag_name
    end
  end

end