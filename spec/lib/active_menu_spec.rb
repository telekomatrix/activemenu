require 'spec_helper'

describe ActiveMenu do

  before :each do
    ActiveMenu::registry.reset
  end

  it 'has a registry of menus' do
    ActiveMenu::registry.should be_a_kind_of(Singleton)
  end

  it 'has no menus on startup' do
    ActiveMenu::registry.menus.length.should == 0
  end

  it 'can create a menu directly' do
    ActiveMenu::create(:someid, 'http://example.com').should be_a_kind_of(ActiveMenu::Menu)
    ActiveMenu::registry.menus.length.should == 1
  end


end