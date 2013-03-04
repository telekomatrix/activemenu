require "active_menu/version"
require "active_menu/menu"
require "active_menu/registry"

module ActiveMenu

  def self.registry
    ActiveMenu::Registry.instance
  end

  def self.create(id, href=nil, &block)
    self.registry.create(id, href, &block)
  end

  def self.reset
    self.registry.reset
  end

  def self.get(id)
    self.registry.get(id)
  end


  def self.exists?(id)
    self.registry.exists?(id)
  end

end