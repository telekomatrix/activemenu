require 'spec_helper'


describe ActiveMenu::Menu do
  subject {ActiveMenu::Menu.new(:idtest)}

  it {should respond_to(:id)}
  it {should respond_to(:submenus)}
  it {should respond_to(:parent)}
  it {should respond_to(:options)}
  
  its(:submenus) {should  be_a(Array)}

  before :each do
    @menu = ActiveMenu::Menu.new(:idtest, href: "http://example.com", text: "My menu")
  end

  #it 'can spec'

  it 'has the right attributes values' do
    @menu.text.should == 'My menu'
    @menu.id.should == :idtest
    @menu.href.should == "http://example.com"
  end

  it 'can add submenus' do
    @submenu = ActiveMenu::Menu.new(:mysubmenu, href: '#an_anchor', text: "My submenu")
    @menu.submenus << @submenu
    @menu.submenus.length.should == 1
  end

  it 'can add submenus directly' do
    submenu =  @menu.submenu(:mysubmenu, href: '#an_anchor', text: "My submenu")
    @menu.submenus.length.should == 1
    submenu.parent.should == @menu
    submenu.parent.id.should == @menu.id
  end


  it 'have a flexible DSL for menus' do
    @menu.submenu(:mysubmenu, text: "test") do |sm|
      @sm = sm
      sm.text 'My submenu'
      sm.submenu(:mysubsubmenu, text: 'test 2') do |ssm|
        @ssm = ssm
        ssm.text == 'My subsubmenu'
      end
    end

    @menu.submenus.length.should == 1
    @sm.submenus.length.should == 1
    @ssm.submenus.length.should == 0

  end


  it 'can add options to a hash' do 
    @menu.options[:tag] = :div
    @menu.options[:tag].should == :div
    @menu.options[:tag] = :ul
    @menu.options[:tag].should == :ul
  end

  it 'can add a tag as a option' do
    @menu.tag :li
    @menu.options[:tag].should == :li
  end

  it 'can add and retrieve the tag name with the #tag method' do
    @menu.tag :li
    @menu.tag.should == :li
    @menu.tag :div
    @menu.tag.should == :div
  end

end