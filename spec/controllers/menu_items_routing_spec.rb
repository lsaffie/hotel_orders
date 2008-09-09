require File.dirname(__FILE__) + '/../spec_helper'

describe MenuItemsController do
  describe "route generation" do
    
    it "should map { :controller ='menu_items', :action => 'index', :menu_id => '1' } to /menus/1/index" do
      route_for(:controller => 'menu_items', :action => 'index', :menu_id => '1').should == '/menus/1/menu_items'
    end
    
    it 'should map { :controller = "menu_items", :action => "new", :menu_id => "1" } to /menus/1/menu_items/new' do
      route_for(:controller => 'menu_items', :action => 'new', :menu_id => '1').should == '/menus/1/menu_items/new'
    end
    
    it 'should map { :controller => "menu_items", :action => "show", :menu_id => "1", :id => "1"} to /menus/1/menu_items/1' do
      route_for(:controller => 'menu_items', :action => 'show', :menu_id => '1', :id => '1').should == '/menus/1/menu_items/1'
    end

    it 'should map { :controller => "menu_items", :action => "edit", :menu_id => "1", :id => "1"} to /menus/1/menu_items/1/edit' do
      route_for(:controller => "menu_items", :action => "edit", :menu_id => '1', :id => '1').should == '/menus/1/menu_items/1/edit'
    end
    
    it 'should map { :controller => "menu_items", :action => "update", :menu_id => "1", :id => "1"} to /menus/1/menu_items/1' do
      route_for(:controller => "menu_items", :action => 'update',  :menu_id => '1', :id => '1').should == '/menus/1/menu_items/1'
    end

    it 'should map { :controller => "menu_items", :action => "destroy", :menu_id => "1", :id => "1"} to /menus/1/menu_items/1' do
      route_for(:controller => "menu_items", :action => 'destroy', :menu_id => '1', :id => 1).should == '/menus/1/menu_items/1'
    end
    
  end

  describe "route recognition" do

    it "should generate params { :controller => 'menu_items', :action => 'index', :menu_id => '1'} from GET /menus/1/menu_items" do
      params_from(:get, "/menus/1/menu_items").should == { :controller => 'menu_items', :action => 'index', :menu_id => '1'}
    end

    it "should generate params { :controller => 'menu_items', :action => 'new', :menu_id => '1'} from GET /menus/1/menu_items/new" do
      params_from(:get, "/menus/1/menu_items/new").should == {:controller => 'menu_items', :action => 'new', :menu_id => '1'}
    end    
    
    it "should generate params { :controller => 'menu_items', :action => 'create', :menu_id => '1'} from POST /menus/1/menu_item" do
      params_from(:post, "/menus/1/menu_items").should == { :controller => 'menu_items', :action => 'create', :menu_id => '1'}
    end
    
    it "should generate params { :controller => 'menu_items', :action => 'show', :menu_id => '1', :id => '1'} from GET /menus/1/menu_items/1" do
      params_from(:get, "/menus/1/menu_items/1").should == {:controller => 'menu_items', :action => 'show', :menu_id => '1', :id => '1'}
    end
    
    it "should generate params { :controller => 'menu_items', :action => 'edit', :menu_id => '1', :id => '1'} from GET /menus/1/menu_items/1/edit" do
      params_from(:get, "/menus/1/menu_items/1/edit").should == {:controller => 'menu_items', :action => 'edit', :menu_id => '1', :id => '1'}
    end
    
    it "should generate params { :controller => 'menu_items', :action => 'update', :menu_id => 1, :id => '1'} from PUT /menus/1/menu_items/1" do
      params_from(:put, "/menus/1/menu_items/1").should == {:controller => "menu_items", :action => "update", :menu_id => "1", :id => "1"}
    end
    
    it "should generate params {:controller => 'menu_items', :action => 'destroy', :menu_id => '1', :id => '1'} from DELETE /menus/1/menu_items/1" do
      params_from(:delete, "/menus/1/menu_items/1").should == {:controller => 'menu_items', :action => 'destroy', :menu_id => '1', :id => '1'}
    end
  end
end