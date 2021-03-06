require "active_menu/version"
require "active_menu/node"
require "active_menu/menu"
require "active_menu/registry"

module ActiveMenu

  def self.registry
    ActiveMenu::Registry.instance
  end

  def self.create(id, options={}, &block)
    self.registry.create(id, options, &block)
  end

  def self.reset
    self.registry.reset
  end

  def self.get(id, &block)
    self.registry.get(id, &block)
  end

  def self.exists?(id)
    self.registry.exists?(id)
  end

end