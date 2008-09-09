require File.dirname(__FILE__) + '/../../spec_helper'

describe '/foodstuffs/new' do
  
  before(:each) do
    foodstuff = mock_model(Foodstuff, :null_object => true)
    assigns[:foodstuff] = foodstuff
    render('/foodstuffs/new', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should be valid xhtml' do
    response.should be_valid_xhtml
  end
  
  it 'should have a link to the "index" action' do
    response.should have_tag('a', :attributes => {:contents => 'Back', :href => '/foodstuffs'})
  end
  
  it 'should have a form with action "/foodstuffs"' do
    response.should have_tag('form', :attributes => {:action => '/foodstuffs'})
  end
  
  describe "/foodstuffs form" do
    
    it 'should have a input field of type "text" with id "foodstuff_name"' do
      response.should have_tag('form', :attributes => {:action => '/foodstuffs'}) do
        with_tag('input', :attributes => {:type => 'text', :id => 'foodstuff_name'})
      end
    end
  
    it 'should have a submit button' do
      response.should have_tag('form', :attributes => {:action => '/foodstuffs'}) do
        with_tag('input', :attributes => {:type => 'submit'})
      end
    end
  end
end