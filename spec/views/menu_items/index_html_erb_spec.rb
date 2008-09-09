require File.dirname(__FILE__) + '/../../spec_helper'

describe '/menu_items/index' do
  
  before(:each) do
    menu_item = mock_model(MenuItem, :name => 'Breakfast', :description => 'description')
    menu = mock_model(Menu, :menu_items => [menu_item])
    assigns[:menu] = menu
    render('menu_items/index', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should contain "Breakfast" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'Breakfast'})
  end
  
  it 'should contain "description" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'description'})
  end
  
  
end