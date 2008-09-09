class MenusController < ApplicationController

  before_filter :login_required

  # GET /menus
  def index
    @menus = Menu.find(:all)
  end

  # GET /menus/1
  def show
    @menu = Menu.find(params[:id])
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  def create
    @menu = Menu.new(params[:menu])
    if @menu.save
      flash[:notice] = 'Menu was successfully created.'
      redirect_to(@menu)
    else
      render :action => "new"
    end
  end

  # PUT /menus/1
  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      flash[:notice] = 'Menu was successfully updated.'
      redirect_to(@menu)
    else
      render :action => "edit"
    end
  end

  # DELETE /menus/1
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to(menus_url)
  end
end
