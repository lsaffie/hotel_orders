require File.dirname(__FILE__) + '/../spec_helper'

describe MenuViewsController do
  describe 'handling GET /menu_views/1' do
    
    before(:each) do
      @menu_item = mock_model(MenuItem)
      @menu = mock_model(Menu, :menu_items => [@menu_item])
      Menu.stub!(:find).and_return(@menu)
    end
    
    def do_get
      get :show, :id => '1'
    end
    
    it 'should find a menu with the id of the requested menu_view' do
      Menu.should_receive(:find).with('1').and_return(@menu)
      do_get
    end
    
    it 'should find a collection of menu_items associated with the found menu' do
      @menu.should_receive(:menu_items).and_return([@menu_item])
      do_get
    end
    
    it 'should assign menu with the id of the requested menu_view for the view' do
      do_get
      assigns[:menu].should == @menu
    end
    
    it 'should assign menu_items with the menu_items associated with the found menu for the view' do
      do_get
      assigns[:menu_items].should == [@menu_item]
    end
    
  end
  
  
  
  
end