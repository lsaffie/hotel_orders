require File.dirname(__FILE__) + '/../../spec_helper'

describe 'orders/new' do
  
  before(:each) do
    render('orders/new', :layout => 'application')
  end

  it 'should render' do
    response.should be_success
  end

  it 'should render valid xhtml' do
    response.should be_valid_xhtml  
  end

  it 'should have a form with action="/orders" and method="post"' do
    response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'})
  end
  
  describe 'orders form' do
    
    it 'should have an input tag of type="text" and id="guest_name"' do
      response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'}) do
        with_tag('input', :attributes => {:type => "text", :id => "guest_name"})
      end
    end

    it 'should have an input tag of type="text" and id="arrival_date"' do
      response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'}) do
        with_tag('input', :attributes => {:type => "text", :id => "arrival_date"})
      end
    end

    it 'should have an input tag of type="text" and id="confirmation_number"' do
      response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'}) do
        with_tag('input', :attributes => {:type => "text", :id => "confirmation_number"})
      end
    end
    
    it 'should have an input tag of type="text" and id="telephone"' do
      response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'}) do
        with_tag('input', :attributes => {:type => "text", :id => "telephone"})
      end
    end
    
    it 'should have an input tag of type="text" and id="email"' do
      response.should have_tag("form", :attributes => {:action => 'orders', :method => 'post'}) do
        with_tag('input', :attributes => {:type => "text", :id => "email"})
      end
    end
    
    
  end
end