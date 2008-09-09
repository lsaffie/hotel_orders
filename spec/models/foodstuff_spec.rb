require File.dirname(__FILE__) + '/../spec_helper'

describe 'A Foodstuff' do
  
  before(:each) do
    @foodstuff = Foodstuff.new
  end
  
  it 'should be an instance of Foodstuff' do
    @foodstuff.should be_an_instance_of(Foodstuff)
  end
  
  it 'should have a has_many association with Option' do
    Foodstuff.reflect_on_association(:options).should_not be_nil
  end
  
  it 'should have a has_and_belongs_to_many assocation with MenuItem' do
    Foodstuff.reflect_on_association(:menu_items).should_not be_nil
  end
  
end

describe 'A valid Foodstuff' do
  
  before(:each) do
    @foodstuff = Foodstuff.new
  end
  
  it 'should have a name attribute' do
    @foodstuff.should_not be_valid
    @foodstuff.name = 'pizza'
    @foodstuff.should be_valid
  end
  
end
