require File.dirname(__FILE__) + '/../../spec_helper'

describe '/foodstuffs/index' do
  
  before(:each) do
    foodstuff = mock_model(Foodstuff, :name => 'Bacon', :id => '1')
    assigns[:foodstuffs] = [foodstuff]
    render('/foodstuffs/index', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should be valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have a link to the "Destroy" action' do
    response.should have_tag('a', :attributes => {:content => 'Destroy', :href => '/foodstuffs'})
  end
  
  it 'should have a link to the "Edit" action' do
    response.should have_tag('a', :attributes => {:content => 'Edit', :href => '/foodstuffs/edit'})
  end
  
  it 'should have a link to the "Show" action' do
    response.should have_tag('a', :attributes => {:content => 'Show', :href => '/foodstuffs/1'})
  end
  
  it 'should have "Bacon" in the response' do
    response.should have_tag('*', :attributes => {:content => 'Bacon'})
  end
  
end