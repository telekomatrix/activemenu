class ActiveMenu::Node
  
  attr_accessor :id, :parent, :children, :options

  def initialize(id, options={}, &block)
    @id = id.to_sym
    @parent = nil
    @children = []
    @options = options
    yield(self) if block_given?
  end


  def option(key, value=nil)
    if value.nil?
      @options[key]
    else
      @options[key] = value
    end
  end

  def tag(value=nil)
    self.option(:tag, value)
  end

  def child(id, options={}, &block)
    new_child = self.class.new(id, options)
    new_child.parent = self
    @children << new_child
    yield(new_child) if block_given?
    new_child
  end

  def get(id, &block)
    id = id.to_sym
    selected = @children.select {|m| m.id == id}
    if selected.length >= 1
      first_element = selected.first
      yield(first_element) if block_given?
      first_element
    else
      false
    end
  end 

  def exists?(id)
    id = id.to_sym
    if self.get(id)
      true
    else
      false
    end
  end

  def leave_children!
    @children = []
  end

  def exists?(id)
    id = id.to_sym
    if self.get(id)
      true
    else
      false
    end
  end


end