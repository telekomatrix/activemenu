require 'spec_helper'


describe ActiveMenu::Menu do
  subject {ActiveMenu::Menu.new(:idtest)}

  it {should respond_to(:id)}
  it {should respond_to(:children)}
  it {should respond_to(:parent)}
  it {should respond_to(:options)}
  
  its(:children) {should  be_a(Array)}

  before :each do
    @menu = ActiveMenu::Menu.new(:idtest, href: "http://example.com", text: "My menu")
  end

  it 'can define dynamic options' do
    @menu.seila = :li
    @menu.seila.should == :li
    @menu.seila = :div
    @menu.seila.should == :div
  end

  it 'starts visible' do
    @menu.visible.should == true
  end

  it 'has the right attributes values' do
    @menu.text.should == 'My menu'
    @menu.id.should == :idtest
    @menu.href.should == "http://example.com"
  end

  it 'can add children' do
    @child = ActiveMenu::Menu.new(:mychild, href: '#an_anchor', text: "My child")
    @menu.children << @child
    @menu.children.length.should == 1
  end

  it 'can add children directly' do
    child =  @menu.child(:mychild, href: '#an_anchor', text: "My child")
    @menu.children.length.should == 1
    child.parent.should == @menu
    child.parent.id.should == @menu.id
  end


  it 'have a flexible DSL for menus' do
    @menu.child(:mychild, text: "test") do |sm|
      @sm = sm
      sm.text = 'My child'
      sm.child(:mysubchild, text: 'test 2') do |ssm|
        @ssm = ssm
        ssm.text == 'My subchild'
      end
    end

    @menu.children.length.should == 1
    @sm.children.length.should == 1
    @ssm.children.length.should == 0

  end


  it 'can add options to a hash' do 
    @menu.options[:tag] = :div
    @menu.options[:tag].should == :div
    @menu.options[:tag] = :ul
    @menu.options[:tag].should == :ul
  end

  it 'can add a tag as a option' do
    @menu.tag = :li
    @menu.options[:tag].should == :li
  end

  it 'can add and retrieve the tag name with the #tag method' do
    @menu.tag = :li
    @menu.tag.should == :li
    @menu.tag = :div
    @menu.tag.should == :div
  end

  it 'can set a visible options' do
    @menu.visible = false
    @menu.visible.should == false
    @menu.visible = true
    @menu.visible.should == true
  end

  it 'can set a undefined method as a option' do
    @menu.author = "Sadjow"
    @menu.author.should == "Sadjow"
  end

end