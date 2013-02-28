# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_menu/version'

Gem::Specification.new do |spec|
  spec.name          = "activemenu"
  spec.version       = ActiveMenu::VERSION
  spec.authors       = ["Sadjow Medeiros Leão"]
  spec.email         = ["sadjow@gmail.com"]
  spec.description   = "A toolkit for menus."
  spec.summary       = "A toolkit for menus."
  spec.homepage      = "https://github.com/sadjow/activemenu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

end
