require File.dirname(__FILE__) + '/../../spec_helper'

describe 'menus/edit' do
  
  before(:each) do
    assigns[:menu] = mock_model(Menu, :null_object => true)
    render('/menus/edit', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have a form with action "/menus/edit" and method="post"' do
    response.should have_tag('form', :attributes => {:action => '/menus', :method => 'put'})
  end
  
  describe '/menus form' do

    it 'should have a input tag of type text and id menu_name' do
      response.should have_tag('form', :attributes => {:action => '/menus', :method => 'put'}) do
        with_tag('input', :attributes => {:type => 'text', :id => 'menu_name'})
      end
    end

    it 'should have a submit button' do
      response.should have_tag('form', :attributes => {:action => '/menus', :method => 'put'}) do
        with_tag('input', :attributes => {:type => 'submit'})
      end
    end

  end
  
end