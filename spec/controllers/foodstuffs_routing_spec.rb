require File.dirname(__FILE__) + '/../spec_helper'

describe FoodstuffsController do
  describe "route generation" do

    it "should map { :controller => 'foodstuffs', :action => 'index' } to /foodstuffs" do
      route_for(:controller => "foodstuffs", :action => "index").should == "/foodstuffs"
    end
  
    it "should map { :controller => 'foodstuffs', :action => 'new' } to /foodstuffs/new" do
      route_for(:controller => "foodstuffs", :action => "new").should == "/foodstuffs/new"
    end
  
    it "should map { :controller => 'foodstuffs', :action => 'show', :id => 1 } to /foodstuffs/1" do
      route_for(:controller => "foodstuffs", :action => "show", :id => 1).should == "/foodstuffs/1"
    end
  
    it "should map { :controller => 'foodstuffs', :action => 'edit', :id => 1 } to /foodstuffs/1/edit" do
      route_for(:controller => "foodstuffs", :action => "edit", :id => 1).should == "/foodstuffs/1/edit"
    end
  
    it "should map { :controller => 'foodstuffs', :action => 'update', :id => 1} to /foodstuffs/1" do
      route_for(:controller => "foodstuffs", :action => "update", :id => 1).should == "/foodstuffs/1"
    end
  
    it "should map { :controller => 'foodstuffs', :action => 'destroy', :id => 1} to /foodstuffs/1" do
      route_for(:controller => "foodstuffs", :action => "destroy", :id => 1).should == "/foodstuffs/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'foodstuffs', action => 'index' } from GET /foodstuffs" do
      params_from(:get, "/foodstuffs").should == {:controller => "foodstuffs", :action => "index"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'new' } from GET /foodstuffs/new" do
      params_from(:get, "/foodstuffs/new").should == {:controller => "foodstuffs", :action => "new"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'create' } from POST /foodstuffs" do
      params_from(:post, "/foodstuffs").should == {:controller => "foodstuffs", :action => "create"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'show', id => '1' } from GET /foodstuffs/1" do
      params_from(:get, "/foodstuffs/1").should == {:controller => "foodstuffs", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'edit', id => '1' } from GET /foodstuffs/1;edit" do
      params_from(:get, "/foodstuffs/1/edit").should == {:controller => "foodstuffs", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'update', id => '1' } from PUT /foodstuffs/1" do
      params_from(:put, "/foodstuffs/1").should == {:controller => "foodstuffs", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'foodstuffs', action => 'destroy', id => '1' } from DELETE /foodstuffs/1" do
      params_from(:delete, "/foodstuffs/1").should == {:controller => "foodstuffs", :action => "destroy", :id => "1"}
    end
  end
end