require File.dirname(__FILE__) + '/../spec_helper'

describe Choice do
    
  it 'should have a belongs_to association with LineItem' do
    Choice.reflect_on_association(:line_item).should_not be_nil
  end
end

describe 'A Choice' do

  before(:each) do
    @choice = Choice.new
  end
  
  it 'should be an instance of Choice' do
    @choice.should be_an_instance_of(Choice)
  end
  
end
