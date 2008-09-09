require File.dirname(__FILE__) + '/../../spec_helper'

describe '/foodstuffs/show' do
  
  before(:each) do
    option = mock_model(Option, :name => 'crispy')
    foodstuff = mock_model(Foodstuff, :name => 'Bacon', :options => [option], :id => '1')
    assigns[:foodstuff] = foodstuff
    assigns[:options] = [option]
    render('/foodstuffs/show', :layout => 'application')
  end
  
  
  it 'should render' do
    response.should be_success
  end
  
  it 'should be valid xhtml' do
    response.should be_valid_xhtml
  end

  it 'should have "Bacon" in the response' do
    response.should have_tag('*', :attributes => {:content => 'Bacon'})
  end
  
  it 'should list the options for the foodstuff' do
    response.should have_tag('li', :attributes => {:content => 'crispy'})
  end
  
  it 'should have a link to create a new option for this foodstuff' do
    response.should have_tag('a', :attributes => {:content => '', :href => '/foodstuffs/1/options/new'})
  end
  
  it 'should have a link to the "edit" action' do
    response.should have_tag('a', :attributes => {:content => 'Edit', :href => '/foodstuffs/1/edit'})
  end
  
  it 'should have a link to the "index" action' do
    response.should have_tag('a', :attributes => {:content => 'Back', :href => '/foodstuffs'})
  end
end