require File.dirname(__FILE__) + '/../spec_helper'


module MenuItemSpecHelper
  
  def valid_menu_item_attributes
    {:name => 'Pizza Meal',
     :description => 'Kick ass pizza',
     :price => 2.50}
  end
end

describe "A MenuItem" do

  before(:each) do
    @menu_item = MenuItem.new
  end
  
  it "should be an instance of MenuItem" do
    @menu_item.should be_an_instance_of(MenuItem)
  end
  
  it 'should have a has_and_belongs_to_many relationship with Foodstuff' do
   MenuItem.reflect_on_association(:foodstuffs).should_not be_nil
  end
  
  it 'should have a belongs_to relationship with Menu' do
    MenuItem.reflect_on_association(:menu).should_not be_nil
  end
    
  it 'should have a has_many association with LineItem' do
    MenuItem.reflect_on_association(:line_items).should_not be_nil
  end
end

describe "A valid MenuItem" do
  include MenuItemSpecHelper
  
  before(:each) do
    @menu_item = MenuItem.new
    @menu_item.stub!(:size).and_return(12345)
    @menu_item.stub!(:content_type).and_return('image/jpg')
    @menu_item.stub!(:filename).and_return('foo')
  end
  
  it 'should have a name' do
    @menu_item.attributes = valid_menu_item_attributes.except(:name)
    @menu_item.should_not be_valid
    @menu_item.name = 'name'
    @menu_item.should be_valid
  end
  
  it 'should have a price' do
    @menu_item.attributes = valid_menu_item_attributes.except(:price)
    @menu_item.should_not be_valid
    @menu_item.price = 2.50
    @menu_item.should be_valid
  end
  
  it 'should have a description' do
    @menu_item.attributes = valid_menu_item_attributes.except(:description)
    @menu_item.should_not be_valid
    @menu_item.description = "A delicious treat"
    @menu_item.should be_valid
  end
  
end

describe MenuItem do

  before(:each) do
    @menu_item = MenuItem.new
    @foodstuff_99 = mock_model(Foodstuff)
    @foodstuff_100 = mock_model(Foodstuff)
    @foodstuff_101 = mock_model(Foodstuff)
    Foodstuff.stub!(:find).with(:all).and_return([@foodstuff_99, @foodstuff_100, @foodstuff_101])
  end

  describe 'addable_foodstuffs' do
    it 'should return the list of all foodstuffs' do
      @menu_item.addable_foodstuffs.should == [@foodstuff_99, @foodstuff_100, @foodstuff_101]
    end
  end

end