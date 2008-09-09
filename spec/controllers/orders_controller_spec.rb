require File.dirname(__FILE__) + '/../spec_helper'

describe OrdersController do
  describe 'handling GET /orders' do
    
    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @order = mock_model(Order)
      Order.stub!(:find).and_return([@order])
    end
    
    def do_get
      get :index
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render the "index" template' do
      do_get
      response.should render_template('index')
    end
    
    it 'should find all Orders' do
      Order.should_receive(:find).with(:all).and_return([@order])
      do_get
    end
    
    it 'should assign the found Orders for the view' do
      do_get
      assigns[:orders].should == [@order]
    end
    
  end
  
  describe 'handling DELETE /orders/1' do
    
    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @order = mock_model(Order, :destroy => true)
      Order.stub!(:find).and_return(@order)
    end
    
    def do_delete
      delete :destroy, :id => '1'
    end
    
    it 'should find the Order requested' do
      Order.should_receive(:find).with('1').and_return(@order)
      do_delete
    end
    
    it 'should destroy the appropriate Order' do
      @order.should_receive(:destroy)
      do_delete
    end
    
    it 'should redirect to the orders index page' do
      do_delete
      response.should redirect_to(orders_url)
    end
    
  end
  
  describe 'handling GET /orders/new' do
    
    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @order = mock_model(Order)
      Order.stub!(:new).and_return(@order)
    end
    
    def do_get
      get :new, :menu_view_id => '1'
    end
    
    describe "when the user has items in their cart" do
      
      before(:each) do
        controller.stub!(:login_required).and_return(true)
        item = mock_model(CartItem, :null_object => true)
        @cart = mock('Cart', :empty? => false, :items => [item] )
        session[:cart] = @cart
      end
      
      it 'should be successful' do
        do_get
        response.should be_success
      end
    
      it 'should render the "new" template' do
        do_get
        response.should render_template('new')
      end
    
      it 'should create a new Order' do
        Order.should_receive(:new).and_return(@order)
        do_get
      end
    
      it 'should not save the new Order' do
        @order.should_not_receive(:save)
        do_get
      end
    
      it 'should assign the Order for the view' do
        do_get
        assigns[:order].should == @order
      end
    
    end
    
    describe "when the user has no items in their cart" do
      
      before(:each) do
        controller.stub!(:login_required).and_return(true)
        @cart = mock('Cart', :empty? => true, :items => [])
        session[:cart] = @cart
      end
      
      it 'should redirect to the appropriate menu_views_path' do
        do_get
        response.should redirect_to(menu_view_path('1'))
      end
      
      it 'should set the flash to contain "YOUR CART IS EMPTY"' do
        do_get
        flash[:notice].should == "YOUR CART IS EMPTY"
      end
    end
  end
  
  describe 'handling POST /orders' do
    
    before(:each) do
      controller.stub!(:login_required).and_return(true)
      @order = mock_model(Order, :add_line_items_from_cart => true, :save => true)
      Order.stub!(:new).and_return(@order)
      @cart = mock('Cart')
      controller.stub!(:find_cart).and_return(@cart)
      session[:cart] = @cart
    end
    
    def do_post
      post :create, :customized_menus => {}
    end

    it 'should create a new Order' do
      Order.should_receive(:new).with({}).and_return(@order)
      do_post
    end

    it 'should add line items from the cart to the Order' do
      @order.should_receive(:add_line_items_from_cart).with(@cart)
      do_post
    end
        
    describe "with successful save" do
      
      it 'should redirect to the orders/index page' do
        @order.should_receive(:save).and_return(true)
        do_post
        response.should redirect_to(orders_path)
      end
      
      it 'should empty the users cart' do
        session[:cart].should == @cart
        do_post
        session[:cart].should == nil
      end
      
    end
    
    describe "with failed save" do
      
      before(:each) do
        controller.stub!(:login_required).and_return(true)
        @order.should_receive(:save).and_return(false)
      end
      
      it 'should re-render the "new" template' do
        do_post
        response.should render_template('new')
      end
      
      it 'should set the flash to "PLEASE FILL OUT ALL REQUIRED FIELDS"' do
        do_post
        flash[:notice].should == "PLEASE FILL OUT ALL REQUIRED FIELDS"
      end
    end
  end
end