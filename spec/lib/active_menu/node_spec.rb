require 'spec_helper'

describe ActiveMenu::Node do
  subject {ActiveMenu::Node.new(:idtest)}

  it {should respond_to(:id)}
  it {should respond_to(:parent)}
  it {should respond_to(:children)}
  it {should respond_to(:options)}
  
  its(:parent) {should be_nil}
  its(:children) {should  be_a(Array)}


  before :each do
    @node = ActiveMenu::Node.new(:mainnode)
  end

  it 'can add childs with #child method' do
    @node.child :childid do |c|
      c.parent.should == @node
    end
  end

  context "with a node with children" do
    
    subject do
      @node.child :childid do |c|
        c.parent.should == @node
      end
    end

    it 'can leave the children!' do
      @node.leave_children!
    end

  end

end