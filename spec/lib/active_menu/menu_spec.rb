require 'spec_helper'


describe ActiveMenu::Menu do
  subject {ActiveMenu::Menu.new(:idtest)}

  it {should respond_to(:id)}
  it {should respond_to(:href)}
  it {should respond_to(:content)}
  it {should respond_to(:submenus)}
  it {should respond_to(:parent)}

  its(:submenus) {should  be_a(Array)}


  before :each do
    @menu = ActiveMenu::Menu.new(:idtest, "http://example.com", "My menu")
  end

  it 'has the right attributes values' do
    @menu.content.should == 'My menu'
    @menu.id.should == :idtest
    @menu.href.should == "http://example.com"
  end

  it 'can add submenus' do
    @submenu = ActiveMenu::Menu.new(:mysubmenu, '#an_anchor', "My submenu")
    @menu.submenus << @submenu
    @menu.submenus.length.should == 1
  end

  it 'can add submenus directly' do
    submenu =  @menu.submenu(:mysubmenu, '#an_anchor', "My submenu")
    @menu.submenus.length.should == 1
    submenu.parent.should == @menu
    submenu.parent.id.should == @menu.id
  end


  it 'have a flexible DSL for menus' do
    @menu.submenu(:mysubmenu, "test") do |sm|
      @sm = sm
      sm.content = 'My submenu'
      sm.submenu(:mysubsubmenu, 'test 2') do |ssm|
        @ssm = ssm
        ssm.content == 'My subsubmenu'
      end
    end

    @menu.submenus.length.should == 1
    @sm.submenus.length.should == 1
    @ssm.submenus.length.should == 0

  end

end