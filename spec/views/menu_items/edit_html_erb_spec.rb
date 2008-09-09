require File.dirname(__FILE__) + '/../../spec_helper'

describe '/menu_items/edit' do
  
  before(:each) do
    menu = mock_model(Menu)
    foodstuff = mock_model(Foodstuff, :name => 'Eggs')
    menu_item = mock_model(MenuItem, :name => 'Breakfast',
                                     :price => 2.50,
                                     :description => 'description',
                                     :foodstuffs => [foodstuff])
    addable_foodstuffs = [foodstuff]
    assigns[:foodstuffs] = [foodstuff]
    assigns[:addable_foodstuffs] = addable_foodstuffs
    assigns[:menu] = menu
    assigns[:menu_item] = menu_item
    render('menu_items/edit', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have "Breakfast" in the response' do
    response.should have_tag('*', :attributes => {:content => 'Breakfast'})
  end
  
  it 'should have "Eggs" in the response' do
    response.should have_tag('*', :attributes => {:content => 'Eggs'})
  end
  
  it 'should have "2.50" in the response' do
    response.should have_tag('*', :attributes => {:content => '2.50'})
  end
  
  it 'should have "description" in the response' do
    response.should have_tag('*', :attributes => {:content => 'description'})
  end
  
  
end