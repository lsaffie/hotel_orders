require File.dirname(__FILE__) + '/../spec_helper'

describe LineItem do
  
  before(:each) do
    @line_item = LineItem.new
  end
  
  it 'should be an instance of LineItem' do
    @line_item.should be_an_instance_of(LineItem)
  end
  
  it 'should have a has_one association with MenuItem' do
    LineItem.reflect_on_association(:menu_item).should_not(be_nil)
  end
  
  it 'should have a has_many association with Choice' do
    LineItem.reflect_on_association(:choices).should_not(be_nil)
  end
  
  it 'should have a belongs_to association with Order' do
    LineItem.reflect_on_association(:order).should_not(be_nil)
  end
end
