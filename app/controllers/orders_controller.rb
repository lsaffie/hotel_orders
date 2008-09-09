class OrdersController < ApplicationController
  
  before_filter :login_required, :except => [:new,:create]

  def index
    @orders = Order.find(:all)
    render
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(orders_url)
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end
    
  def new
    if session[:cart].items.empty?
      flash[:notice] = 'YOUR CART IS EMPTY'
      redirect_to(menu_view_path(params[:menu_view_id]))
    else
      @menu_id = session[:cart].items[0].menu_item.menu_id
      @order = Order.new
      #@order.menu_id(@menu_id)
      @cart = find_cart
      @delivery_times1=['12:00pm-12:15pm','12:15pm-12:30pm','12:45pm-1:00pm','1:00pm-1:15pm','1:15pm-1:30pm','1:45pm-2:00pm',
        '2:00pm-2:15pm','2:15pm-2:30pm','2:45pm-3:00pm','3:00pm-3:15pm','3:15pm-3:30pm','3:45pm-4:00pm',
        '4:00pm-4:15pm','4:15pm-4:30pm','4:45pm-5:00pm']
      @delivery_times2=['5:00pm-5:15pm','5:15pm-5:30pm','5:45pm-6:00pm','6:00pm-6:15pm','6:15pm-6:30pm','6:45pm-7:00pm',
        '7:00pm-7:15pm','7:15pm-7:30pm','7:45pm-8:00pm','8:00pm-8:15pm','8:15pm-8:30pm','8:45pm-9:00pm',
        '9:00pm-9:15pm','9:15pm-9:30pm','9:4pm5-10:00pm']
      @delivery_times1bf=['6:00am-6:15am','6:15am-6:30am','6:45am-7:00am',
        '7:00am-7:15am','7:15am-7:30am','7:45am-8:00am']
         @delivery_times2bf=['8:00am-8:15am','8:15am-8:30am','8:45am-9:00am']
         render
    end
  end
  
  def create
    @menu_id = session[:cart].items[0].menu_item.menu_id
    @delivery_times1=['12:00pm-12:15pm','12:15pm-12:30pm','12:45pm-1:00pm','1:00pm-1:15pm','1:15pm-1:30pm','1:45pm-2:00pm',
      '2:00pm-2:15pm','2:15pm-2:30pm','2:45pm-3:00pm','3:00pm-3:15pm','3:15pm-3:30pm','3:45pm-4:00pm',
      '4:00pm-4:15pm','4:15pm-4:30pm','4:45pm-5:00pm']
    @delivery_times2=['5:00pm-5:15pm','5:15pm-5:30pm','5:45pm-6:00pm','6:00pm-6:15pm','6:15pm-6:30pm','6:45pm-7:00pm',
      '7:00pm-7:15pm','7:15pm-7:30pm','7:45pm-8:00pm','8:00pm-8:15pm','8:15pm-8:30pm','8:45pm-9:00pm',
      '9:00pm-9:15pm','9:15pm-9:30pm','9:4pm5-10:00pm']
    @delivery_times1bf=['6:00am-6:15am','6:15am-6:30am','6:45am-7:00am',
      '7:00am-7:15am','7:15am-7:30am','7:45am-8:00am']
    @delivery_times2bf=['8:00am-8:15am','8:15am-8:30am','8:45am-9:00am']
     msg = ''
    @cart = find_cart
    @order = Order.new(params[:customized_menus])
    @order.add_line_items_from_cart(@cart)
    @order.total_price = @order.total
    msg = @order.check_delivery_times(@order,@menu_id)
    if msg == ''
      if @order.save
          Mailer.deliver_confirm_admin(@order,@cart)
          Mailer.deliver_confirm_guest(@order,@cart)
          session[:cart] = nil
          redirect_to(confirmations_path) and return
        else
          #flash[:notice] = "PLEASE FILL OUT ALL REQUIRED FIELDS"
          render :action => "new"
      end
    else
      flash[:notice] = msg
      render :action => "new"
    end
end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update_attribute(:order_status,params[:order_status])
    order.update_attribute(:updated_by,session[:username])
    redirect_to orders_path
  end
end
