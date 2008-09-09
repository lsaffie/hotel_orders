class OptionsController < ApplicationController
  
  # GET /foodstuffs/1/options
  def index
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @options = Option.find(:all, :conditions => ['foodstuff_id == ?', @foodstuff.id])
  end
  
  # GET /foodstuffs/1/options/1
  def show
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.find(params[:id])
  end
  
  # GET /foodstuffs/1/options/new
  def new
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.new
  end
  
  # POST /foodstuffs/1/options
  def create
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.new(params[:option])
    @option.foodstuff_id = @foodstuff.id
    if @option.save
      redirect_to foodstuff_path(@foodstuff)
    else
      render :action => 'new'
    end
  end
  
  # GET /foodstuffs/1/options/1
  def edit
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.find(params[:id])
  end
  
  # PUT /foodstuffs/1/options/1
  def update
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.find(params[:id])
    if @option.update_attributes(params[:option])
      #redirect_to foodstuff_option_path(@foodstuff, @option)
      redirect_to foodstuff_path(@foodstuff)
    else
      render :action => "edit"
    end
  end
  
  # DELETE /foodstuffs/1/options/1
  def destroy
    @foodstuff = Foodstuff.find(params[:foodstuff_id])
    @option = Option.find(params[:id])
    @option.destroy
    redirect_to foodstuff_options_path(@foodstuff)
  end  
end