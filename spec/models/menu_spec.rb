require File.dirname(__FILE__) + '/../spec_helper'


describe 'A Menu' do
  
  before(:each) do
    @menu = Menu.new
  end
  
  it 'should be an instance of Menu' do
    @menu.should be_an_instance_of(Menu)
  end 
  
  it 'should have a has_many association with MenuItem' do
    Menu.reflect_on_association(:menu_items).should_not be_nil
  end
end

describe 'A valid Menu' do
  
  before(:each) do
    @menu = Menu.new
  end
  
  it 'should have a name attribute' do
    @menu.should_not be_valid
    @menu.name = 'name'
    @menu.should be_valid
  end
  
end
