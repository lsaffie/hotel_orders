require File.dirname(__FILE__) + '/../spec_helper'

describe MenusController do
  describe "route generation" do

    it "should map { :controller => 'menus', :action => 'index' } to /menus" do
      route_for(:controller => "menus", :action => "index").should == "/menus"
    end
  
    it "should map { :controller => 'menus', :action => 'new' } to /menus/new" do
      route_for(:controller => "menus", :action => "new").should == "/menus/new"
    end
  
    it "should map { :controller => 'menus', :action => 'show', :id => 1 } to /menus/1" do
      route_for(:controller => "menus", :action => "show", :id => 1).should == "/menus/1"
    end
  
    it "should map { :controller => 'menus', :action => 'edit', :id => 1 } to /menus/1/edit" do
      route_for(:controller => "menus", :action => "edit", :id => 1).should == "/menus/1/edit"
    end
  
    it "should map { :controller => 'menus', :action => 'update', :id => 1} to /menus/1" do
      route_for(:controller => "menus", :action => "update", :id => 1).should == "/menus/1"
    end
  
    it "should map { :controller => 'menus', :action => 'destroy', :id => 1} to /menus/1" do
      route_for(:controller => "menus", :action => "destroy", :id => 1).should == "/menus/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'menus', action => 'index' } from GET /menus" do
      params_from(:get, "/menus").should == {:controller => "menus", :action => "index"}
    end
  
    it "should generate params { :controller => 'menus', action => 'new' } from GET /menus/new" do
      params_from(:get, "/menus/new").should == {:controller => "menus", :action => "new"}
    end
  
    it "should generate params { :controller => 'menus', action => 'create' } from POST /menus" do
      params_from(:post, "/menus").should == {:controller => "menus", :action => "create"}
    end
  
    it "should generate params { :controller => 'menus', action => 'show', id => '1' } from GET /menus/1" do
      params_from(:get, "/menus/1").should == {:controller => "menus", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'menus', action => 'edit', id => '1' } from GET /menus/1;edit" do
      params_from(:get, "/menus/1/edit").should == {:controller => "menus", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'menus', action => 'update', id => '1' } from PUT /menus/1" do
      params_from(:put, "/menus/1").should == {:controller => "menus", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'menus', action => 'destroy', id => '1' } from DELETE /menus/1" do
      params_from(:delete, "/menus/1").should == {:controller => "menus", :action => "destroy", :id => "1"}
    end
  end
end