class MenuViewsController < ApplicationController
  
  
  # GET /menu_views/1
  def index
    redirect_to menu_view_path(1)
  end
  
  def show
    @menu = Menu.find(params[:id])
    @menu_items = @menu.menu_items
    @cart = find_cart
    @menu_view_id = 1
    @menu_id = params[:id]
  end
  
  def create
    @cart = find_cart
    menu_item = MenuItem.find(params[:id])
    @cart.add_menuitem
  end
  
end
