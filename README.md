![ActiveMenu Logo](https://raw.github.com/sadjow/activemenu/master/activemenu_logo.png)

[![Gem Version](https://fury-badge.herokuapp.com/rb/activemenu.png)](http://badge.fury.io/rb/activemenu)
[![Build Status](https://travis-ci.org/sadjow/activemenu.png)](https://travis-ci.org/sadjow/activemenu)
[![Dependency Status](https://gemnasium.com/sadjow/activemenu.png)](https://gemnasium.com/sadjow/activemenu)
[![Code Climate](https://codeclimate.com/github/sadjow/activemenu.png)](https://codeclimate.com/github/sadjow/activemenu)

Create menus with multi-level and a Domain Specific Language (DSL) for menus.
It's extremely Object Oriented. It still doesn't have code for render, but you can combine it with
other mechanism for rendering, like simple-navigation or other.

## Semantic Versioning (http://semver.org/)
This gem is following the [Semantic Versioning](http://semver.org/)

## Features
  * Compatible with any application or framework.
  * Singleton registry for menus (ActiveMenu::Registry), you can define menus anywhere. (But, use your conscience to a good design.)
  * Domain Specific Language
  * You can define the menu along multiple gems(like plugins of Rails)

## Some wiki
[Using simple-navigation with activemenu](https://github.com/sadjow/activemenu/wiki/Using-simple-navigation-for-render-the-activemenu)

## Initial example
```ruby
  ActiveMenu::create('admix-nav') do |nav|        
          
    nav.child :dashboard do |dashboard|
      dashboard.text = Proc.new { t('dashboard.dashboard') }
      dashboard.href = Proc.new { admix_root_url }
      dashboard.icon = 'icon-flag'
    end

    nav.child :general do |general|
      general.text = Proc.new { t('general.general') }
      general.icon = 'icon-flag'
      general.href = 'javascript:;'
      general.visible = Proc.new {current_user.has_role?(:admin)}
    end

    nav.child :content do |content|
      content.text = Proc.new { t('content.content') }
      content.href = 'javascript:;'
      content.icon = 'icon-flag'
    end

  end
```

## Installation

Add this line to your application's Gemfile:

    gem 'activemenu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemenu

## Usage

### Creating menus objects in the registry

```ruby
ActiveMenu::create(:mymenu)
#....
# In another gem you can use 
@menu = ActiveMenu::get(:mymenu).child do |sub|
  sub.content = 'My content'
end
```
### exists?
```ruby
  ActiveMenu::create(:someid)
  ActiveMenu::exists?(:someid) # == true
  ActiveMenu::exists?(:this_id_doesnt_exists) # == false
``` 

### visible
```ruby
  ActiveMenu::get(:someid).visible
```

### Get the menu
You can retrieve the menu instance with the method get...
```ruby
  @menu = ActiveMenu::get(:someid)
```

or, you can use a block too and retrieve it as the first param.

```ruby
  ActiveMenu::get(:someid) do |menu|
    menu.id # The menu id
  end
```

### Set options to the menu
These options are write to a hash, that you can use with other gem to render it.
```ruby
  @menu = ActiveMenu::get(:someid)
  @menu.myoption = 'my value'
  @menu.myoption2 = Proc.new { my_dynamic_method #that will run when I use this option }
```

## Standard DSL (Domain Specific Language) options

To facilitate the creating of menus, there are some methods to help you organize the options standard.

### visible(value=nil)
You can pass a variable or a Proc to be executed to the visible method.
```ruby
  ActiveMenu::create('admix-nav') do |nav|        
    nav.child :general do |general|
      general.text = Proc.new { t('general.general') }
      general.icon = 'icon-flag'
      general.visible = Proc.new {current_user.has_role? :admin}
    end
  end

end
```

### tag(value=nil)
You can set the tag for the menu element or can retrieve it.
```ruby
    @menu = ActiveMenu::get(:my_menu)
    @menu.tag :li
    @menu.tag # --> :li
    @menu.tag :div
    @menu.tag # --> :div
```

### text()

### Nested menus
```ruby
@menu = ActiveMenu::Menu.new(:mainmenu, href: 'http://example.com') 
# def initialize(id, options={}, &block) .... yield(self) if block_given?
@menu.child(:mychild, href: "test") do |sm|
  sm.text 'My child'
  sm.child(:mysubchild, href:'test 2') do |ssm|
    ssm.text = 'My subchild'
  end
end
# Let's improve this DSL, contribute please.
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
