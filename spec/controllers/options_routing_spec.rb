require File.dirname(__FILE__) + '/../spec_helper'

describe OptionsController do
  describe "route generation" do
    
    it "should map { :controller ='options', :action => 'index', :foodstuff_id => '1' } to /foodstuffs/1/index" do
      route_for(:controller => 'options', :action => 'index', :foodstuff_id => '1').should == '/foodstuffs/1/options'
    end
    
    it 'should map { :controller = "options", :action => "new", :foodstuff_id => "1" } to /foodstuffs/1/options/new' do
      route_for(:controller => 'options', :action => 'new', :foodstuff_id => '1').should == '/foodstuffs/1/options/new'
    end
    
    it 'should map { :controller => "options", :action => "show", :foodstuff_id => "1", :id => "1"} to /foodstuffs/1/options/1' do
      route_for(:controller => 'options', :action => 'show', :foodstuff_id => '1', :id => '1').should == '/foodstuffs/1/options/1'
    end

    it 'should map { :controller => "options", :action => "edit", :foodstuff_id => "1", :id => "1"} to /foodstuffs/1/options/1/edit' do
      route_for(:controller => "options", :action => "edit", :foodstuff_id => '1', :id => '1').should == '/foodstuffs/1/options/1/edit'
    end
    
    it 'should map { :controller => "options", :action => "update", :foodstuff_id => "1", :id => "1"} to /foodstuffs/1/options/1' do
      route_for(:controller => "options", :action => 'update',  :foodstuff_id => '1', :id => '1').should == '/foodstuffs/1/options/1'
    end

    it 'should map { :controller => "options", :action => "destroy", :foodstuff_id => "1", :id => "1"} to /foodstuffs/1/options/1' do
      route_for(:controller => "options", :action => 'destroy', :foodstuff_id => '1', :id => 1).should == '/foodstuffs/1/options/1'
    end
    
  end

  describe "route recognition" do

    it "should generate params { :controller => 'options', :action => 'index', :foodstuff_id => '1'} from GET /foodstuffs/1/options" do
      params_from(:get, "/foodstuffs/1/options").should == { :controller => 'options', :action => 'index', :foodstuff_id => '1'}
    end

    it "should generate params { :controller => 'options', :action => 'new', :foodstuff_id => '1'} from GET /foodstuffs/1/options/new" do
      params_from(:get, "/foodstuffs/1/options/new").should == {:controller => 'options', :action => 'new', :foodstuff_id => '1'}
    end    
    
    it "should generate params { :controller => 'options', :action => 'create', :foodstuff_id => '1'} from POST /foodstuffs/1/menu_item" do
      params_from(:post, "/foodstuffs/1/options").should == { :controller => 'options', :action => 'create', :foodstuff_id => '1'}
    end
    
    it "should generate params { :controller => 'options', :action => 'show', :foodstuff_id => '1', :id => '1'} from GET /foodstuffs/1/options/1" do
      params_from(:get, "/foodstuffs/1/options/1").should == {:controller => 'options', :action => 'show', :foodstuff_id => '1', :id => '1'}
    end
    
    it "should generate params { :controller => 'options', :action => 'edit', :foodstuff_id => '1', :id => '1'} from GET /foodstuffs/1/options/1/edit" do
      params_from(:get, "/foodstuffs/1/options/1/edit").should == {:controller => 'options', :action => 'edit', :foodstuff_id => '1', :id => '1'}
    end
    
    it "should generate params { :controller => 'options', :action => 'update', :foodstuff_id => 1, :id => '1'} from PUT /foodstuffs/1/options/1" do
      params_from(:put, "/foodstuffs/1/options/1").should == {:controller => "options", :action => "update", :foodstuff_id => "1", :id => "1"}
    end
    
    it "should generate params {:controller => 'options', :action => 'destroy', :foodstuff_id => '1', :id => '1'} from DELETE /foodstuffs/1/options/1" do
      params_from(:delete, "/foodstuffs/1/options/1").should == {:controller => 'options', :action => 'destroy', :foodstuff_id => '1', :id => '1'}
    end
  end
end