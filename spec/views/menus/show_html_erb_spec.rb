require File.dirname(__FILE__) + '/../../spec_helper'

describe 'menus/show' do
  
  before(:each) do
    menu_item = mock_model(MenuItem, :null_object => true)
    menu = mock_model(Menu, :name => 'Breakfast', :menu_items => [menu_item])
    assigns[:menu] = menu
    render('/menus/show', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have "Breakfast" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'Breakfast'})
  end
  
  it 'should have a link to an edit action' do
    response.should have_tag('a', :attributes => {:href => '/menus/1/edit', :contents => 'Edit'})
  end
  
  it 'should have a link back to the index action' do
    response.should have_tag('a', :attributes => {:href => '/menus', :contents => 'Back'})
  end

end