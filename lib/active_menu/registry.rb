require 'singleton'
class ActiveMenu::Registry
  include Singleton

  attr_accessor :menus

  def initialize
    @menus = []
  end

  def create(id, href, &block)
    menu = ActiveMenu::Menu.new(id, href, &block)
    @menus << menu
    menu
  end

  def reset
    @menus = []
  end

end