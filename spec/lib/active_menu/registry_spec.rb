require 'spec_helper'

describe 'ActiveMenu::Registry' do
  subject {ActiveMenu::Registry.instance}
  it {should respond_to(:menus)}
  it {should be_a_kind_of(Singleton)}

  it 'can reset the menus to zero' do
    ActiveMenu::Registry.instance.create(:idmenu, 'http://example.com')
    ActiveMenu::Registry.instance.menus.length == 1
    ActiveMenu::Registry.instance.reset
    ActiveMenu::Registry.instance.menus.length == 0
  end

end