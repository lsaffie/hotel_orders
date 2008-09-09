require File.dirname(__FILE__) + '/../spec_helper'

describe 'An Option' do
  
  before(:each) do
    @option = Option.new
  end
  
  it 'should be an instance of Option' do
    @option.should be_an_instance_of(Option)
  end
  
  it 'should have a belongs_to association with Foodstuff' do
    Option.reflect_on_association(:foodstuff).should_not be_nil  
  end
  
  it 'should have a has_many association with Choice' do
    Option.reflect_on_association(:choices).should_not be_nil
  end
end

describe 'A valid Option' do
  
  before(:each) do
    @option = Option.new
  end
  
  it 'should have a name attribute' do
    @option.should_not be_valid
    @option.name = 'name'
    @option.should be_valid
  end
  
  
end