class MenuItemsController < ApplicationController
  
  before_filter :login_required, :only => [:index, :edit, :create, :update, :new]
  # GET /menus/1/menu_items
  def index
    @menu = Menu.find(params[:menu_id])
  end
  
  def show
    redirect_to(menu_menu_items_path)
  end
  # GET /menu/1/menu_items/new
  def new
    @menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.new
    @addable_foodstuffs = @menu_item.addable_foodstuffs
  end

  # GET /menu_items/1/edit
  def edit
    @menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    @foodstuffs = @menu_item.foodstuffs
    @addable_foodstuffs = @menu_item.addable_foodstuffs
  end

  # POST /menu/1/menu_items
  def create
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.menu_items.new(params[:menu_item])
    
    if @menu_item.save
      flash[:notice] = 'MenuItem was successfully created.'
      redirect_to(menu_menu_item_path(@menu, @menu_item))
    else
      render :action => "new"
    end
  end

  def update
  # PUT /menus/1/menu_items/1
    @menu = Menu.find(params[:menu_id])
    @menu_item = MenuItem.find(params[:id])
    
    @foodstuffs = Foodstuff.find(:all)
    checked_foodstuffs = []
    checked_params = params[:foodstuff_checked] || []
    for foodstuff_id in checked_params
      foodstuff = Foodstuff.find(foodstuff_id)
      unless @menu_item.foodstuffs.include?(foodstuff)
        @menu_item.foodstuffs << foodstuff
      end
      checked_foodstuffs << foodstuff
    end
    missing_foodstuff = @foodstuffs - checked_foodstuffs
    for foodstuff in missing_foodstuff
      if @menu_item.foodstuffs.include?(foodstuff)
        @menu_item.foodstuffs.delete(foodstuff)
      end
    end

    if @menu_item.update_attributes(params[:menu_item])
      flash[:notice] = 'MenuItem was successfully updated.'
      redirect_to(menu_menu_item_path(@menu, @menu_item))
    else
      render :action => "edit"
    end
  end

  # DELETE /menus/1/menu_items/1
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    redirect_to(menu_menu_items_path(params[:menu_id]))
  end
  
end
