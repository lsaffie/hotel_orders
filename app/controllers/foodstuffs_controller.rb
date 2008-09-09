class FoodstuffsController < ApplicationController

  before_filter :login_required

  # GET /foodstuffs
  def index
    @foodstuffs = Foodstuff.find(:all)
  end

  # GET /foodstuffs/1
  def show
    @foodstuff = Foodstuff.find(params[:id])
    @options = @foodstuff.options
  end

  # GET /foodstuffs/new
  def new
    @foodstuff = Foodstuff.new
  end

  # GET /foodstuffs/1/edit
  def edit
    @foodstuff = Foodstuff.find(params[:id])
  end

  # POST /foodstuffs
  def create
    @foodstuff = Foodstuff.new(params[:foodstuff])
    if @foodstuff.save
      flash[:notice] = 'Foodstuffs was successfully created.'
      redirect_to(@foodstuff)
    else
      render :action => "new"
    end
  end

  # PUT /foodstuffs/1
  def update
    @foodstuff = Foodstuff.find(params[:id])

    if @foodstuff.update_attributes(params[:foodstuff])
      flash[:notice] = 'Foodstuffs was successfully updated.'
      redirect_to(@foodstuff)
    else
      render :action => "edit"
    end
  end

  # DELETE /foodstuffs/1
  def destroy
    @foodstuff = Foodstuff.find(params[:id])
    @foodstuff.destroy
    redirect_to(foodstuffs_path)
  end
end
