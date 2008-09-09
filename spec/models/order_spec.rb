require File.dirname(__FILE__) + '/../spec_helper'


describe Order do
  
  
  it 'should have a has_many association with LineItem' do
    Order.reflect_on_association(:line_items).should_not be_nil
  end
  
  describe 'instance' do
    
    before(:each) do
      @order = Order.new
    end
    
    it 'should be an instance of Order' do
      @order.should be_an_instance_of(Order)
    end
  end
end
