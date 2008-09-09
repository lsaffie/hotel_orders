require File.dirname(__FILE__) + '/../../spec_helper'

describe '/menus' do
  
  before(:each) do
    menu_item = mock_model(MenuItem, :null_object => true)
    menu = mock_model(Menu, :name => 'Breakfast', :menu_items => [menu_item])
    menus = [menu]
    assigns[:menus] = menus
    render('/menus/index', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have "Breakfast" in the response' do
    response.should have_tag('h1', :content => 'Breakfast')
  end
  
end