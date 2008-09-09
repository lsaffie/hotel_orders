require File.dirname(__FILE__) + '/../spec_helper'

describe CartController do
  
  
  describe "handling POST /cart" do

    before(:each) do
      @cart = mock('Cart')
      Cart.stub!(:new).and_return(@cart)
    end
    
    def do_post
      post :create
    end
    
    describe 'when a user already has a cart' do
      
      before(:each) do
        session[:cart] = @cart
      end
      
      it 'should not create a new cart object' do
        Cart.should_not_receive(:new)
        do_post
      end
    end
    
    describe 'when a user does not have a cart' do
      
      it 'should create new cart object' do
        Cart.should_receive(:new).and_return(@cart)
        do_post
      end
      
    end
    
    it 'should store a cart object in the session' do
      Cart.should_receive(:new).and_return(@cart)
      do_post
      session[:cart].should eql(@cart)
    end
    
    it 'should redirect back to the calling page'
  end
  
  describe 'handling PUT /cart' do
    
    before(:each) do
      @menu_item = mock_model(MenuItem)
      MenuItem.stub!(:find).and_return(@menu_item)
      @menu = mock_model(Menu, :id => "1")
      @menu_item.should_receive(:menu).and_return(@menu)
      option = mock_model(Option)
      @cart = mock('Cart', :add_items => true, 
                           :chosen_options => [option], 
                           :chosen_quantities => [1,2,3],
                           :quantity_check => nil)
      @cart.stub!(:chosen_options).and_return(@options)
      Cart.stub!(:new).and_return(@cart)
    end
    
    
    def do_put
      put :update, :menu_item => {:id => '1'}
    end
    
    it 'should find the MenuItem in question' do
      MenuItem.should_receive(:find).with('1').and_return(@menu_item)
      do_put
    end
    
    it 'should find the users cart' do
      do_put
      session[:cart].should eql(@cart)
    end
    
    # it 'should add MenuItem to the cart' do
    #   @cart.should_receive(:add_items).with(@menu_item, @options)
    #   do_put
    # end
    
    it 'should redirect to the MenuView associated with the MenuItem' do
      do_put
      response.should(be_redirect)
    end
  end
  
  
  describe "handling DELETE /cart" do
    
    
    before(:each) do
      @cart = mock('Cart')
      session[:cart] = @cart
    end
    
    def do_delete
      delete :destroy
    end
    
    it 'should remove the users cart from the session' do
      session[:cart].should eql(@cart)
      do_delete
      session[:cart].should be_nil
    end
    
    it 'should redirect to the appropriate MenuView' do
      do_delete
      response.should be_redirect
    end
    
  end
end