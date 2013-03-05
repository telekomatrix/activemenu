# ActiveMenu

[![Build Status](https://travis-ci.org/sadjow/activemenu.png)](https://travis-ci.org/sadjow/activemenu)
[![Dependency Status](https://gemnasium.com/sadjow/activemenu.png)](https://gemnasium.com/sadjow/activemenu)
[![Code Climate](https://codeclimate.com/github/sadjow/activemenu.png)](https://codeclimate.com/github/sadjow/activemenu)

A toolkit to create menus with multi level and a Domain Specific Language(DSL) for Menus.
It's extremely Object Oriented. It still doesn't have code for render, but you can combine it with
other renderer like simple-navigation or you own.

## Installation

Add this line to your application's Gemfile:

    gem 'activemenu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemenu

## Usage

### Creating menus objects

```ruby
ActiveMenu::create(:mymenu)
#....
# In another gem you can use 
@menu = ActiveMenu::get(:mymenu).submenu do |sub|
  sub.content == 'My content'
end
```
### exists?
```ruby
  ActiveMenu::create(:someid)
  ActiveMenu::exists?(:someid) # == true
  ActiveMenu::exists?(:this_id_doesnt_exists) # == false
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
  @menu.options[:tag] = :div
  @menu.options[:myoptions] = 'myvalue'
```

## Standard DSL (Domain Specific Language) options

To facilitate the creating of menus, there are some methods to help you organize the options standard.

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
@menu.submenu(:mysubmenu, href: "test") do |sm|
  sm.text 'My submenu'
  sm.submenu(:mysubsubmenu, href:'test 2') do |ssm|
    ssm.text 'My subsubmenu'
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
