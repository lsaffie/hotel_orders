require File.dirname(__FILE__) + '/../spec_helper'

describe MenuViewsController do
  describe "route generation" do

    it "should map { :controller => 'menu_views', :action => 'index' } to /menu_views" do
      route_for(:controller => "menu_views", :action => "index").should == "/menu_views"
    end
  
    it "should map { :controller => 'menu_views', :action => 'new' } to /menu_views/new" do
      route_for(:controller => "menu_views", :action => "new").should == "/menu_views/new"
    end
  
    it "should map { :controller => 'menu_views', :action => 'show', :id => 1 } to /menu_views/1" do
      route_for(:controller => "menu_views", :action => "show", :id => 1).should == "/menu_views/1"
    end
  
    it "should map { :controller => 'menu_views', :action => 'edit', :id => 1 } to /menu_views/1/edit" do
      route_for(:controller => "menu_views", :action => "edit", :id => 1).should == "/menu_views/1/edit"
    end
  
    it "should map { :controller => 'menu_views', :action => 'update', :id => 1} to /menu_views/1" do
      route_for(:controller => "menu_views", :action => "update", :id => 1).should == "/menu_views/1"
    end
  
    it "should map { :controller => 'menu_views', :action => 'destroy', :id => 1} to /menu_views/1" do
      route_for(:controller => "menu_views", :action => "destroy", :id => 1).should == "/menu_views/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'menu_views', action => 'index' } from GET /menu_views" do
      params_from(:get, "/menu_views").should == {:controller => "menu_views", :action => "index"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'new' } from GET /menu_views/new" do
      params_from(:get, "/menu_views/new").should == {:controller => "menu_views", :action => "new"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'create' } from POST /menu_views" do
      params_from(:post, "/menu_views").should == {:controller => "menu_views", :action => "create"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'show', id => '1' } from GET /menu_views/1" do
      params_from(:get, "/menu_views/1").should == {:controller => "menu_views", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'edit', id => '1' } from GET /menu_views/1;edit" do
      params_from(:get, "/menu_views/1/edit").should == {:controller => "menu_views", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'update', id => '1' } from PUT /menu_views/1" do
      params_from(:put, "/menu_views/1").should == {:controller => "menu_views", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'menu_views', action => 'destroy', id => '1' } from DELETE /menu_views/1" do
      params_from(:delete, "/menu_views/1").should == {:controller => "menu_views", :action => "destroy", :id => "1"}
    end
  end
end
