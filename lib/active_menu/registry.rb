require 'singleton'
class ActiveMenu::Registry
  include Singleton

  attr_accessor :menus

  def initialize
    @menus = []
  end

  def create(id, options={}, &block)
    menu = ActiveMenu::Menu.new(id, options, &block)
    @menus << menu
    menu
  end

  def reset
    @menus = []
  end

  def get(id, &block)
    id = id.to_sym
    selected = @menus.select {|m| m.id == id}
    if selected.length >= 1
      yield(selected.first) if block_given?
      selected.first
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

end