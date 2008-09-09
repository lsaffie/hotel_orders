require File.dirname(__FILE__) + '/../../spec_helper'

describe '/foodstuffs/edit' do
  
  before(:each) do
    foodstuff = mock_model(Foodstuff, :name => 'Bacon', :id => '1')
    assigns[:foodstuff] = foodstuff
    render('/foodstuffs/edit', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should be valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have a link to the foodstuff "Show" action' do
    response.should have_tag('a', :attributes => {:content => 'Show', :href => '/foodstuff/1'})
  end
  
  it 'should have a link to the foodstuff "Index" Action' do
    response.should have_tag('a', :attributes => {:content => 'Back', :href => '/foodstuffs'})
  end
end