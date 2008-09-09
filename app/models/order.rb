class Order < ActiveRecord::Base

  # def before_validation_on_create
  #    self.telephone = telephone.gsub(/[^0-9]/, "")
  # end

  
    validates_presence_of :telephone
    validates_length_of :telephone, :is=>10, :message => "MUST CONSIST OF 10 DIGITS!"
  
    validates_presence_of :guest_name, :arrival_date, :confirmation_number, :delivery_time
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    #validates_numericality_of :confirmation_number
    validates_length_of :confirmation_number, :is => 8, :message => "CONFIRMATION NUMBER MUST BE 8 CHARACTERS"
    validates_confirmation_of :email, :message => "EMAIL ADDRESSES MUST MATCH"
  
  #validates_presence_of :guest_name, :room_number, :delivery_time
  
  
	has_many :line_items
	



	def menu_id(menu_id)
	  #@menu_id = menu_id
	  #session[:menu_id] = @menu_id
  end
	
	def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
    
  # TODO spec me
  def total
    line_items.map(&:price).compact.sum
  end
  
  def check_delivery_times(order,menu_id)
    ending_char = order.delivery_time.index("-")
    delivery_time = order.delivery_time[0..ending_char]
    #delivery_hour = Time.parse delivery_time
     time_now = Time.now
     #hour_now = time_now.hour
    delivery_date = order.delivery_date
    delivery_datetime = Time.parse delivery_date.to_s + "-"+delivery_time
    delivery_time = order.delivery_time
    number_of_orders = Order.find(:all, :conditions => ["delivery_date = ? and delivery_time = ?", delivery_date, delivery_time])
    #number_of_orders.length
    msg = ""
    ##if time_now+24.hours > delivery_datetime
     #if delivery_date <= Date.today #&& delivery_hour.hour <= hour_now
    if delivery_datetime < Time.now+24.hours
      msg += "THE ORDER NEEDS TO BE MADE AT LEAST 24 HOURS PRIOR TO THE GAME"
    end
    if menu_id = 1
      if number_of_orders.length >= 3
        msg += "PLEASE CHOOSE A DIFFERENT DELIVERY TIME"
       end
    end
    if menu_id = 2
      if number_of_orders.length >= 2
        msg += "PLEASE CHOOSE A DIFFERENT DELIVERY TIME"
       end
    end
      msg
  end
end

