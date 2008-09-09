require File.dirname(__FILE__) + '/../spec_helper'

describe OrdersController do
  describe "route generation" do

    it "should map { :controller => 'orders', :action => 'index' } to /orders" do
      route_for(:controller => "orders", :action => "index").should == "/orders"
    end
  
    it "should map { :controller => 'orders', :action => 'new' } to /orders/new" do
      route_for(:controller => "orders", :action => "new").should == "/orders/new"
    end
  
    it "should map { :controller => 'orders', :action => 'show', :id => 1 } to /orders/1" do
      route_for(:controller => "orders", :action => "show", :id => 1).should == "/orders/1"
    end
  
    it "should map { :controller => 'orders', :action => 'edit', :id => 1 } to /orders/1/edit" do
      route_for(:controller => "orders", :action => "edit", :id => 1).should == "/orders/1/edit"
    end
  
    it "should map { :controller => 'orders', :action => 'update', :id => 1} to /orders/1" do
      route_for(:controller => "orders", :action => "update", :id => 1).should == "/orders/1"
    end
  
    it "should map { :controller => 'orders', :action => 'destroy', :id => 1} to /orders/1" do
      route_for(:controller => "orders", :action => "destroy", :id => 1).should == "/orders/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'orders', action => 'index' } from GET /orders" do
      params_from(:get, "/orders").should == {:controller => "orders", :action => "index"}
    end
  
    it "should generate params { :controller => 'orders', action => 'new' } from GET /orders/new" do
      params_from(:get, "/orders/new").should == {:controller => "orders", :action => "new"}
    end
  
    it "should generate params { :controller => 'orders', action => 'create' } from POST /orders" do
      params_from(:post, "/orders").should == {:controller => "orders", :action => "create"}
    end
  
    it "should generate params { :controller => 'orders', action => 'show', id => '1' } from GET /orders/1" do
      params_from(:get, "/orders/1").should == {:controller => "orders", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'orders', action => 'edit', id => '1' } from GET /orders/1/edit" do
      params_from(:get, "/orders/1/edit").should == {:controller => "orders", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'orders', action => 'update', id => '1' } from PUT /orders/1" do
      params_from(:put, "/orders/1").should == {:controller => "orders", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'orders', action => 'destroy', id => '1' } from DELETE /orders/1" do
      params_from(:delete, "/orders/1").should == {:controller => "orders", :action => "destroy", :id => "1"}
    end
  end
end
