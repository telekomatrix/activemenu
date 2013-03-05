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
    ActiveMenu::create(:someid, href: 'http://example.com').should be_a_kind_of(ActiveMenu::Menu)
    ActiveMenu::registry.menus.length.should == 1
  end

  it 'can create and retrieve a container for menus' do
    m1 = ActiveMenu::create('admin-nav')
    m2 = ActiveMenu::get('admin-nav')
    m1.should == m2
  end

  it 'can check if a menu exists.' do
    ActiveMenu::create(:someid)
    ActiveMenu::exists?(:someid).should == true
    ActiveMenu::exists?(:this_id_doesnt_exists).should == false
  end


  it 'can create menus with lambdas' do
    ActiveMenu::create('admix-nav') do |nav|
      nav.tag :div
      
      nav.submenu :dashboard do |d|
        d.text 'dashboard.dashboard'
        d.href lambda { admix_root_url }
        d.option :icon, 'icon-flag'
      end
      
    end
  end

end