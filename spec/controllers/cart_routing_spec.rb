require File.dirname(__FILE__) + '/../spec_helper'

describe CartController do
  describe "route generation" do
    
    it "should map { :controller => 'cart', :action => 'create'} to /cart" do
      route_for(:controller => 'cart', :action => 'create').should == '/cart'
    end
    
    it "should map { :controller => 'cart', :action => 'destroy'} to /cart" do
      route_for(:controller => 'cart', :action => 'destroy').should == '/cart'
    end
    
    it "should map { :controller => 'cart', :action => 'update'} to /cart" do
      route_for(:controller => 'cart', :action => 'update').should == '/cart'
    end
    
    it "should map { :controller => 'cart', :action => 'show'} to /cart" do
      route_for(:controller => 'cart', :action => 'show').should == '/cart'
    end
    
  end

  describe "route recognition" do
    
    it "should generate params { :controller => 'cart', :action => 'create' } from POST /cart" do
      params_from(:post, "/cart").should ==  { :controller => 'cart', :action => 'create'}
    end

    it "should generate params { :controller => 'cart', :action => 'show' } from GET /cart" do
      params_from(:get, "/cart").should == { :controller => 'cart', :action => 'show'}
    end
    
    it "should generate params { :controller => 'cart', :action => 'update'} from PUT /cart" do
      params_from(:put, '/cart').should == { :controller => 'cart', :action => 'update'}
    end
    
    it "should generate params { :controller => 'cart', :action => 'destroy'} from DELETE /cart" do
      params_from(:delete, '/cart').should == { :controller => 'cart', :action => 'destroy'}
    end

  end
end