require File.dirname(__FILE__) + '/../spec_helper'


describe MenuItemsController do
  describe "handling GET /menus/1/menu_items" do
    before(:each) do
      @menu = mock_model(Menu)
      @menu_items = mock_model(MenuItem)
      @menu.stub!(:menu_items).and_return(@menu_items)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:find).and_return(@menu_items)
    end
    
    def do_get
      get :index, :menu_id =>  @menu.id
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
    
    it 'should render index template' do
      do_get
      response.should render_template('index')
    end
    
    it 'should find the correct Menu' do
      Menu.should_receive(:find).and_return(@menu)
      do_get
    end
    
    it 'should assign the found Menu for the view' do
      do_get
      assigns[:menu].should == @menu
    end
  end


  describe "handling GET /menus/1/menu_items/new"  do
    
    before(:each) do
      @menu = mock_model(Menu)
      @foodstuff = mock_model(Foodstuff)
      @menu_item = mock_model(MenuItem, :addable_foodstuffs => [@foodstuff])
      @menu.stub!(:menu_items).and_return(@menu_item)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:new).and_return(@menu_item)
    end
    
    def do_get
      get :new, :menu_id => '1'
    end
    
    it "should be successful" do
      do_get
      response.should be_success
    end
    
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
    
    it "should create a new menu_item" do
      MenuItem.should_receive(:new).and_return(@menu_item)
      do_get
    end
    
    it "should find the requested menu" do
      Menu.should_receive(:find).and_return(@menu)
      do_get
    end
    
    it "should not save the new menu_item" do
      @menu_item.should_not_receive(:save)
      do_get
    end
    
    it "should assign the new menu_item for the view" do
      do_get
      assigns[:menu_item].should == @menu_item
    end
    
    it 'should assign a collection of addable foodstuffs for the view' do
      do_get
      assigns[:addable_foodstuffs].should == [@foodstuff]
    end
        
    it "should assign the found menu for the view" do
      do_get
      assigns[:menu].should == @menu
    end
  end

  describe "handling GET /menus/1/menu_items/1/edit" do

    before(:each) do
      @menu = mock_model(Menu)
      @foodstuff = mock_model(Foodstuff)
      @menu_item = mock_model(MenuItem, :addable_foodstuffs => [@foodstuff], :foodstuffs => [@foodstuff])
      @menu.stub!(:menu_items).and_return(@menu_item)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:find).and_return(@menu_item)
    end

    def do_get
      get :edit, :menu_id => @menu.id.to_s, :id => @menu_item.id.to_s
    end

    it 'should be successful' do
      do_get
      response.should be_success
    end

    it 'should render edit template' do
      do_get
      response.should render_template('edit')
    end

    it 'should find the menu requested' do
      Menu.should_receive(:find).and_return(@menu)
      do_get
    end

    it 'should find the menu_item requested' do
      MenuItem.should_receive(:find).with(@menu_item.id.to_s).and_return(@menu_item)
      do_get
    end

    it 'should find all the foodstuffs associated with the menu_item for the view' do
      @menu_item.should_receive(:foodstuffs).and_return([@foodstuff])
      do_get
    end
      
    
    it 'should find all the foodstuffs not associated with the menu_item' do
      @menu_item.should_receive(:addable_foodstuffs).and_return([@foodstuff])
      do_get
    end
    
    it 'should assign the found menu for the view' do
      do_get
      assigns[:menu].should == @menu
    end
    
    it 'should assign the found menu_item for the view' do
      do_get
      assigns[:menu_item].should == @menu_item
    end
    
    it 'should assign a collection of all the foodstuffs associated with the menu_item for the view' do
      do_get
      assigns[:foodstuffs].should == [@foodstuff]
    end
    
    it 'should assign a collection of all the foodstuffs *not* associated with the menu_item for the view' do
      do_get
      assigns[:addable_foodstuffs].should == [@foodstuff]
    end
    
  end

  describe "handling POST /menus/1/menu_items" do

    before(:each) do
      @menu = mock_model(Menu)
      @menu_item = mock_model(MenuItem)
      @menu_item.stub!(:new).and_return(@menu_item)
      @menu.stub!(:menu_items).and_return(@menu_item)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:new).and_return(@menu_item)
    end
    
    describe  "with successful save" do
      
      def do_post
        @menu_item.should_receive(:save).and_return(true)
        post :create, :menu_id => '1', :menu_items => {}
      end
      
      it 'should create a new menu_item' do
        do_post
      end
      
      it 'should redirect to the new menu_item' do
        do_post
        response.should redirect_to(menu_menu_item_url(@menu.id, @menu_item.id))
      end
    end
    
    describe "with failed save" do
      
      def do_post
        @menu_item.should_receive(:save).and_return(false)
        post :create, :menu_id => @menu.id, :menu_item => {}
      end
      
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /menus/1/menu_items/1" do
    
    before(:each) do
      @menu = mock_model(Menu)
      @menu_item = mock_model(MenuItem)
      @menu.stub!(:menu_items).and_return(@menu_item)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:find).and_return(@menu_item)
    end
    
    describe "with successful update" do
      
      def do_put
        @menu_item.should_receive(:update_attributes).and_return(true)
        put :update, :menu_id => @menu.id.to_s, :id => @menu_item.id.to_s
      end
      
      it 'should find the menu_item requested' do
        MenuItem.should_receive(:find).with(@menu_item.id.to_s).and_return(@menu_item)
        do_put
      end
      
      it 'should find the menu requested' do
        Menu.should_receive(:find).and_return(@menu)
        do_put
      end
      
      it 'should update the found menu_item' do
        do_put
        assigns(:menu_item).should == @menu_item
      end
      
      it 'should assign the found menu_item for the view' do
        do_put
        assigns(:menu_item).should == @menu_item
      end
      
      it 'should assign the found menu for the view' do
        do_put
        assigns(:menu).should == @menu
      end
      
      it 'should redirect to the found menu_item' do
        do_put
        response.should redirect_to(menu_menu_item_path(@menu.id.to_s, @menu_item.id.to_s))
      end
    end
    
    
    describe "with failed update" do
      
      def do_put
        @menu_item.should_receive(:update_attributes).and_return(false)
        put :update, :menu_id => @menu.id.to_s, :id => @menu_item.id.to_s
        
      end
      
      it 'should re-render "edit"' do
        do_put
        response.should render_template('edit')
      end
        
    end
  end
  
  describe "handling DELETE /menus/1/menu_items/1" do
    before(:each) do
      @menu = mock_model(Menu)
      @menu_item = mock_model(MenuItem, :destroy => true)
      @menu.stub!(:menu_items).and_return(@menu_item)
      Menu.stub!(:find).and_return(@menu)
      MenuItem.stub!(:find).and_return(@menu_item)
    end
    
    def do_delete
      delete :destroy, :menu_id => @menu.id.to_s, :id => @menu_item.id.to_s
    end
    
    it 'should find the menu_item requested' do
      MenuItem.should_receive(:find).with(@menu_item.id.to_s).and_return(@menu_item)
      do_delete
    end
    
    it 'call destroy on the found menu_item' do
      @menu_item.should_receive(:destroy)
      do_delete
    end
    
    it 'should redirect to the menu_items list' do
      do_delete
      response.should redirect_to(menu_menu_items_path(@menu.id.to_s))
    end
  end
end
