require 'singleton'
class ActiveMenu::Registry
  include Singleton

  attr_accessor :main_node

  def initialize
    @main_node = ActiveMenu::Menu.new(:main_node)
  end

  def create(id, options={}, &block)
    @main_node.child(id, options, &block)
  end

  def reset
    @main_node.leave_children!
  end

  def get(id, &block)
    @main_node.get(id, &block)
  end

  def menus
    @main_node.children
  end

  def exists?(id)
    @main_node.exists?(id)
  end

end