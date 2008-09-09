require File.dirname(__FILE__) + '/../spec_helper'

describe MenusController do
  describe "handling GET /menus" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu)
      Menu.stub!(:find).and_return([@menu])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all menus" do
      Menu.should_receive(:find).with(:all).and_return([@menu])
      do_get
    end
  
    it "should assign the found menus for the view" do
      do_get
      assigns[:menus].should == [@menu]
    end
  end


  describe "handling GET /menus/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu)
      Menu.stub!(:find).and_return(@menu)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the menu requested" do
      Menu.should_receive(:find).with("1").and_return(@menu)
      do_get
    end
  
    it "should assign the found menu for the view" do
      do_get
      assigns[:menu].should equal(@menu)
    end
  end


  describe "handling GET /menus/new" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu)
      Menu.stub!(:new).and_return(@menu)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new menu" do
      Menu.should_receive(:new).and_return(@menu)
      do_get
    end
  
    it "should not save the new menu" do
      @menu.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new menu for the view" do
      do_get
      assigns[:menu].should equal(@menu)
    end
  end

  describe "handling GET /menus/1/edit" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu)
      Menu.stub!(:find).and_return(@menu)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the menu requested" do
      Menu.should_receive(:find).and_return(@menu)
      do_get
    end
  
    it "should assign the found Menu for the view" do
      do_get
      assigns[:menu].should equal(@menu)
    end
  end

  describe "handling POST /menus" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu, :to_param => "1")
      Menu.stub!(:new).and_return(@menu)
    end
    
    describe "with successful save" do
  
      def do_post
        @menu.should_receive(:save).and_return(true)
        post :create, :menu => {}
      end
  
      it "should create a new menu" do
        Menu.should_receive(:new).with({}).and_return(@menu)
        do_post
      end

      it "should redirect to the new menu" do
        do_post
        response.should redirect_to(menu_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @menu.should_receive(:save).and_return(false)
        post :create, :menu => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /menus/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu, :to_param => "1")
      Menu.stub!(:find).and_return(@menu)
    end
    
    describe "with successful update" do

      def do_put
        @menu.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the menu requested" do
        Menu.should_receive(:find).with("1").and_return(@menu)
        do_put
      end

      it "should update the found menu" do
        do_put
        assigns(:menu).should equal(@menu)
      end

      it "should assign the found menu for the view" do
        do_put
        assigns(:menu).should equal(@menu)
      end

      it "should redirect to the menu" do
        do_put
        response.should redirect_to(menu_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @menu.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /menus/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @menu = mock_model(Menu, :destroy => true)
      Menu.stub!(:find).and_return(@menu)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the menu requested" do
      Menu.should_receive(:find).with("1").and_return(@menu)
      do_delete
    end
  
    it "should call destroy on the found menu" do
      @menu.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the menus list" do
      do_delete
      response.should redirect_to(menus_url)
    end
  end
end