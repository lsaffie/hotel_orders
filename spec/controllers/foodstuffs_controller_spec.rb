require File.dirname(__FILE__) + '/../spec_helper'

describe FoodstuffsController do
  
  describe "handling GET /foodstuffs" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuffs = mock_model(Foodstuff)
      Foodstuff.stub!(:find).and_return([@foodstuffs])
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
  
    it "should find all foodstuffs" do
      Foodstuff.should_receive(:find).with(:all).and_return([@foodstuffs])
      do_get
    end
  
    it "should assign the found foodstuffs for the view" do
      do_get
      assigns[:foodstuffs].should == [@foodstuffs]
    end
  end


  describe "handling GET /foodstuffs/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      @foodstuff.stub!(:options).and_return([@option])
      Foodstuff.stub!(:find).and_return(@foodstuff)
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
  
    it "should find the foodstuff requested" do
      Foodstuff.should_receive(:find).with("1").and_return(@foodstuff)
      do_get
    end
    
    it 'should find the options associated with the requested foodstuff' do
      @foodstuff.should_receive(:options).and_return([@option])
      do_get
    end
  
    it "should assign the found foodstuff for the view" do
      do_get
      assigns[:foodstuff].should equal(@foodstuff)
    end
    
    it 'should assign the foudn options for the view' do
      do_get
      assigns[:options].should  == [@option]
    end
    
  end


  describe "handling GET /foodstuffs/new" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff)
      Foodstuff.stub!(:new).and_return(@foodstuff)
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
  
    it "should create an new foodstuff" do
      Foodstuff.should_receive(:new).and_return(@foodstuff)
      do_get
    end
  
    it "should not save the new foodstuff" do
      @foodstuff.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new foodstuff for the view" do
      do_get
      assigns[:foodstuff].should equal(@foodstuff)
    end
  end

  describe "handling GET /foodstuffs/1/edit" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff)
      Foodstuff.stub!(:find).and_return(@foodstuff)
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
  
    it "should find the foodstuff requested" do
      Foodstuff.should_receive(:find).and_return(@foodstuff)
      do_get
    end
  
    it "should assign the found Foodstuffs for the view" do
      do_get
      assigns[:foodstuff].should equal(@foodstuff)
    end
  end

  describe "handling POST /foodstuffs" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff, :to_param => "1")
      Foodstuff.stub!(:new).and_return(@foodstuff)
    end
    
    describe "with successful save" do
  
      def do_post
        @foodstuff.should_receive(:save).and_return(true)
        post :create, :foodstuff => {}
      end
  
      it "should create a new foodstuff" do
        Foodstuff.should_receive(:new).with({}).and_return(@foodstuff)
        do_post
      end

      it "should redirect to the new foodstuff" do
        do_post
        response.should redirect_to(foodstuff_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        controller.stub!(:login_required).and_return(true)
        @foodstuff.should_receive(:save).and_return(false)
        post :create, :foodstuff => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /foodstuffs/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff, :to_param => "1")
      Foodstuff.stub!(:find).and_return(@foodstuff)
    end
    
    describe "with successful update" do

      def do_put
        @foodstuff.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the foodstuff requested" do
        Foodstuff.should_receive(:find).with("1").and_return(@foodstuff)
        do_put
      end

      it "should update the found foodstuff" do
        do_put
        assigns(:foodstuff).should equal(@foodstuff)
      end

      it "should assign the found foodstuff for the view" do
        do_put
        assigns(:foodstuff).should equal(@foodstuff)
      end

      it "should redirect to the foodstuff" do
        do_put
        response.should redirect_to(foodstuff_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        controller.stub!(:login_required).and_return(true)
        @foodstuff.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /foodstuffs/1" do

    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @foodstuff = mock_model(Foodstuff, :destroy => true)
      Foodstuff.stub!(:find).and_return(@foodstuff)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the foodstuff requested" do
      Foodstuff.should_receive(:find).with("1").and_return(@foodstuff)
      do_delete
    end
  
    it "should call destroy on the found foodstuff" do
      @foodstuff.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the foodstuffs list" do
      do_delete
      response.should redirect_to(foodstuffs_url)
    end
  end
end