require File.dirname(__FILE__) + '/../spec_helper'


describe OptionsController do
  describe "handling GET /foodstuffs/1/options" do
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:find).and_return([@option])
    end
    
    def do_get
      get :index, :foodstuff_id => '1'
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render "index" template' do
      do_get
      response.should render_template('index')
    end
    
    it 'should find the correct Foodstuff' do 
      Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
      do_get
    end
    
    it 'should find the correct Options' do
      Option.should_receive(:find).with(:all, :conditions => ['foodstuff_id == ?', @foodstuff.id]).and_return([@option])
      do_get
    end
    
    it 'should assign the foodstuff for the view' do
      do_get
      assigns[:foodstuff].should == @foodstuff
    end
    
    it 'should assign the options for the view' do
      do_get
      assigns[:options].should == [@option]
    end
  end

  describe "handling GET /foodstuffs/1/options/1" do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:find).and_return(@option)
    end
    
    def do_get
      get :show, :id => '1', :foodstuff_id => '1'
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render the "show" template' do
      do_get
      response.should render_template('show')
    end
    
    it 'should find the foodstuff requested' do
      Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
      do_get
    end
    
    it 'should find the option requested' do
      Option.should_receive(:find).with('1').and_return(@option)
      do_get
    end
    
    it 'should assign the foodstuff for the view' do
      do_get
      assigns[:foodstuff].should == @foodstuff
    end
    
    it 'should assign the option for the view' do
      do_get
      assigns[:option].should == @option
    end
  end

  describe "handling GET /foodstuffs/1/options/new"  do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:new).and_return(@option)
    end
    
    def do_get
      get :new, :foodstuff_id => '1'
    end

    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render the "new" template' do
      do_get
      response.should render_template('new')
    end
    
    it 'should find the requested Foodstuff' do
      Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
      do_get
    end
    
    it 'should create a new Option' do
      Option.should_receive(:new).and_return(@option)
      do_get
    end
    
    it 'should not save the new option' do
      @option.should_not_receive(:save)
      do_get
    end
    
    it 'should assign the foodstuff to the view' do
      do_get
      assigns[:foodstuff].should == @foodstuff
    end
    
    it 'should assign the option to the view' do
      do_get
      assigns[:option].should == @option
    end

  end
  
  describe "handling POST /foodstuffs/1/options" do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option, :foodstuff_id= => @foodstuff.id)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:new).and_return(@option)
    end
    
    describe 'with successful post' do
      def do_post
        @option.should_receive(:save).and_return(true)
        post :create, :foodstuff_id => '1', :option => {}
      end
    
      it 'should find the requested Foodstuff' do
        Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
        do_post
      end
    
      it 'should create a new Option' do
        Option.should_receive(:new).and_return(@option)
        do_post
      end
    
      it 'should redirect to the option' do
        do_post
        response.should redirect_to(foodstuff_path(@foodstuff))
      end
      
    end
    
    describe 'with failed save' do
      
      def do_post
        @option.should_receive(:save).and_return(false)
        post :create, :foodstuff_id => '1', :option => {}
      end
      
      it 'should re-render the "new" template' do
        do_post
        response.should render_template('new')
      end
      
    end
  end
  
  describe "handling GET /foodstuffs/1/options/1" do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:find).and_return(@option)
    end
    
    def do_get
      get :edit, :foodstuff_id => '1', :id => '1'
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render template "edit"' do
      do_get
      response.should render_template('edit')
    end
    
    it 'should find the correct Foodstuff' do
      Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
      do_get
    end
    
    it 'should find the correct Option' do
      Option.should_receive(:find).with('1').and_return(@option)
      do_get
    end
    
    it 'should assign the foodstuff to the view' do
      do_get
      assigns[:foodstuff].should == @foodstuff
    end
    
    it 'should assign the option to the view' do
      do_get
      assigns[:option].should == @option
    end
  end
  
  describe "handling PUT /foodstuffs/1/options/1"  do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:find).and_return(@option)
    end
    
    describe 'with successful update' do
      
      def do_put
        @option.should_receive(:update_attributes).and_return(true)
        put :update, :foodstuff_id => '1', :id => '1', :option => {}
      end
      
      it 'should find the Foodstuff requested' do
        Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
        do_put
      end
      
      it 'should find the Option requested' do
        Option.should_receive(:find).with('1').and_return(@option)
        do_put
      end
      
      it 'should update the found option' do
        do_put
        assigns[:option].should == @option
      end
      
      it 'should assign the foodstuff for the view' do
        do_put
        assigns[:foodstuff].should == @foodstuff
      end
      
      it 'should assign the option for the view' do
        do_put
        assigns[:option].should == @option
      end
      
      it 'should redirect to the found option' do
        do_put
        response.should redirect_to(foodstuff_option_path(@foodstuff.id.to_s, @option.id.to_s))
      end
      
    end
    
    describe 'with failed update' do

      def do_put
        @option.should_receive(:update_attributes).and_return(false)
        put :update, :foodstuff_id => '1', :id => '1', :option => {}
      end
      
      it 'should re-render "edit"' do
        do_put
        response.should render_template('edit')
      end
    end
  end
  
  describe "handling DELETE /foodstuffs/1/options/1" do
    
    before(:each) do
      @foodstuff = mock_model(Foodstuff)
      @option = mock_model(Option, :destroy => true)
      Foodstuff.stub!(:find).and_return(@foodstuff)
      Option.stub!(:find).and_return(@option)
    end 
    
    def do_delete
      delete :destroy, :foodstuff_id => '1', :id => '1'
    end
    
    it 'should find the requested Foodstuff' do
      Foodstuff.should_receive(:find).with('1').and_return(@foodstuff)
      do_delete
    end
    
    it 'should find the requested Option' do
      Option.should_receive(:find).with('1').and_return(@option)
      do_delete
    end
    
    it 'should call destroy on the found option' do
      @option.should_receive(:destroy)
      do_delete
    end
    
    it 'should redirect to the options list' do
      do_delete
      response.should redirect_to(foodstuff_options_path(@foodstuff.id.to_s))
    end
  end
end