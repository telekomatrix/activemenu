require 'spec_helper'

describe 'ActiveMenu::Registry' do
  subject {ActiveMenu::Registry.instance}
  it {should respond_to(:menus)}
  it {should be_a_kind_of(Singleton)}


  before :each do
    ActiveMenu::Registry.instance.reset
  end

  it 'can reset the menus to zero' do
    ActiveMenu::Registry.instance.create(:idmenu, href: 'http://example.com')
    ActiveMenu::Registry.instance.menus.length == 1
    ActiveMenu::Registry.instance.reset
    ActiveMenu::Registry.instance.menus.length == 0
  end

  it 'can get a menu and yield it to a block' do
    ActiveMenu::Registry.instance.create(:idmenu, href: 'http://example.com')
    ActiveMenu::get(:idmenu) do |m|
      m.id.should == :idmenu
    end
  end

end