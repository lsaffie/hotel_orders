require File.dirname(__FILE__) + '/../../spec_helper'

describe 'customized_menus/show' do
  
  before(:each) do
    option = mock_model(Option, :name => 'Over Easy', :quantity_allowed => 2)
    foodstuff = mock_model(Foodstuff, :name => 'Eggs', :options => [option])
    menu_item = mock_model(MenuItem, :name =>  'Breakfast', 
                                               :filename? => false, 
                                               :description => 'description',
                                               :price => 2.50,
                                               :foodstuffs => [foodstuff])
    assigns[:foodstuffs] = [foodstuff]
    assigns[:menu_item] = menu_item
    assigns[:quantity] = [0,1,2,3,4]
    render('customized_menus/show', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have "2.50" in the response' do
    response.should have_tag('*', :attributes => {:contents => '2.50'})
  end
  
  it 'should have "description" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'description'})
  end
  
  it 'should have "Eggs" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'Eggs'})
  end
  
  it 'should have "Over Easy" in the response' do
    response.should have_tag('*', :attributes => {:contents => 'Over Easy'})
  end
    
end