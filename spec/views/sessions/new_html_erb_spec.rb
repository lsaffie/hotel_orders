require File.dirname(__FILE__) + '/../../spec_helper'

describe 'sessions/new' do
  
  before(:each) do
    render('/sessions/new', :layout => 'application')
  end
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should render valid xhtml' do
    response.should be_valid_xhtml
  end
    
  
  it 'should have a form with action "/sessions" and method="post"' do
    response.should have_tag('form', :attributes => {:action => '/sessions', :method => 'post'})
  end
  
  it 'should have an input tag with type text' do
    response.should have_tag('input', :attributes => {:type => 'text'})
  end
  
  it 'should have an input tag with type password' do
    response.should have_tag('input', :attributes => {:type => 'password'})
  end
  
  it 'should have an input tag with type submit' do
    response.should have_tag('input', :attributes => {:type => 'submit'})
  end
end