require 'singleton'
class ActiveMenu::Registry
  include Singleton

  attr_accessor :menus

  def initialize
    @menus = []
  end

  def create(id, href, &block)
    menu = ActiveMenu::Menu.new(id, href=nil, &block)
    @menus << menu
    menu
  end

  def reset
    @menus = []
  end

  def get(id)
    id = id.to_sym
    @menus.select {|m| m.id == id}.first
  end

end