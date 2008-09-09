class CartController < ApplicationController
  
  before_filter :find_cart

  def create
  end
  
  def update
    @menu_item = MenuItem.find(params[:menu_item][:id])
    cart = Cart.new
    @sauce = params[:sauces] ||= []
    @option = params[:option] ||= []
    if params[:foodstuff]
      @foodstuff_quantity = cart.chosen_foodstuff_quantity(params[:foodstuff])
    end
    @options = cart.chosen_options(@option,@sauce)
    @quantities = cart.chosen_quantities(@option)
    
    msg = cart.quantity_check(@quantities, @options, @menu_item.name, @foodstuff_quantity)
    if msg == ''
      session[:cart].add_items(@menu_item, @options, @quantities, @foodstuff_quantity)
      redirect_to(menu_view_path(@menu_item.menu.id)) and return
    else
      flash[:notice] = msg
      redirect_to(customized_menu_path(@menu_item)) and return
    end
  end
  
  def destroy
    if session[:cart].items[0]
      @menu_id = session[:cart].items[0].menu_item.menu_id
      session[:cart] = nil
      #redirect_to(menu_view_path(params[:menu_view_id]))
      redirect_to(menu_view_path(@menu_id))
    end
  end
    
  
end