# ActiveMenu

A toolkit to create menus with multi level and a Domain Specific Lanague(DSL) for Menus.
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

```ruby
@menu = ActiveMenu::create(:mymenu)
```


```ruby
@menu = ActiveMenu::Menu.new(:mainmenu, 'http://example.com') 
# def initialize(id, href, content=nil, submenus=[], parent=nil, &block) .... yield(self) if block_given?
@menu.submenu(:mysubmenu, "test") do |sm|
  sm.content = 'My submenu'
  sm.submenu(:mysubsubmenu, 'test 2') do |ssm|
    ssm.content == 'My subsubmenu'
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
