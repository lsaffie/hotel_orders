class Cart 
	
	attr_reader :items
	attr_reader :total_price
	
	def initialize
		@items = []
		@total_price = 0.0 
	end
	
	def add_items(menu_item, options, quantities, foodstuff_quantity)
    @items << CartItem.new(menu_item, menu_item.price, options, quantities, foodstuff_quantity)
    @total_price += menu_item.price
	end

    def chosen_options(option,sauce)
      my_chosen_option_ids = option.find_all {|key,val| val['quantity_allowed'] > '0'}
      ids = my_chosen_option_ids.map {|x| x.first}
      unless sauce == []
        ids << Option.find(:all, :conditions => ["name = ?", sauce])[0].id
      end
      ids.map {|id| Option.find(id)}
    end
    
    def chosen_quantities(option)
  	  my_chosen_option_ids = option.find_all {|key,val| val['quantity_allowed'] > '0'}
      ids = my_chosen_option_ids.map {|x| x.first}
      my_chosen_option_ids.map {|x| x[1]['quantity_allowed']}
    end
    
    def chosen_foodstuff_quantity(foodstuffs)
      fs = foodstuffs.find_all {|key,val| val['quantity'] > '0'}
      q = fs.map {|x| x[1]}
      q.map {|x| x['quantity']}
    end
    
    def chosen_foodstuffs(options)
      options.foodstuff
    end

    def quantity_check(quantities, options, menu_item_name, foodstuff_quantity)
     i = 0
     msg = ''
     pop_counter = 0
     pizza_counter = 0
     chip_counter = 0
     dog_counter = 0
     sauce_counter = 0
     chicken_wings_counter = 0
     chicken_fingers_counter = 0
     a6dog_counter = 0
     a6dog_tmp_counter = 0
     nacho_counter = 0
     fs_quantity = 0
     #hotdog_selection = 0
     while i < options.length
       option_id = options[i].id
       foodstuff_id = options[i].foodstuff_id
       option_quantity = quantities[i] 
       if foodstuff_quantity
         fs_quantity += foodstuff_quantity[i].to_i
       else
         fs_quantity = 1
       end
       if Foodstuff.find(foodstuff_id).name == "Pop"
         pop_counter += option_quantity.to_i
       elsif Foodstuff.find(foodstuff_id).name == "Chips"
         chip_counter += option_quantity.to_i 
       elsif Foodstuff.find(foodstuff_id).name == "Pizza"
         pizza_counter += option_quantity.to_i 
       elsif Foodstuff.find(foodstuff_id).name == "Hot Dog"
         dog_counter += option_quantity.to_i 
       elsif Foodstuff.find(foodstuff_id).name == "Sauce" 
         sauce_counter += option_quantity.to_i 
       elsif Foodstuff.find(foodstuff_id).name == "12 Chicken Wings" 
         #option_quantity = 1 
         chicken_wings_counter += option_quantity.to_i 
       elsif Foodstuff.find(foodstuff_id).name == "6 Hot Dogs" 
         a6dog_tmp_counter += option_quantity.to_i
         #hotdog_selection = 1
         if a6dog_tmp_counter == 6
           a6dog_counter += 1
           a6dog_tmp_counter = 0
         elsif a6dog_tmp_counter == 12
           a6dog_counter += 2
           a6dog_tmp_counter = 0
         elsif a6dog_tmp_counter == 24
           a6dog_counter += 3
           a6dog_tmp_counter = 0
         end
       elsif Foodstuff.find(foodstuff_id).name.start_with?('Nacho') 
         nacho_counter += option_quantity.to_i
       elsif Foodstuff.find(foodstuff_id).name.start_with?('8') 
         chicken_fingers_counter += option_quantity.to_i
       end
       i += 1
     end 
     
     # if a6dog_counter == 0 && hotdog_selection == 1
     #        msg = "PLEASE SELECT THE NUMBER OF VEGETARIAN/BEEF HOTDOGS <br>"
     #      end
     custom_counter = pizza_counter + dog_counter + chicken_wings_counter + a6dog_counter + nacho_counter + chicken_fingers_counter
     # if fs_quantity != 0
     #        custom_counter *= fs_quantity
     #      end
     if menu_item_name == "Custom Meal 1"
       if pop_counter != 2
        msg +="PLEASE CHOOSE 2 POPS <br>"
       end
       if custom_counter != 2
        msg +="PLEASE CHOOSE 2 MENU ITEMS <br>"
       end
     elsif menu_item_name == "Custom Meal 2"
         if pop_counter != 3
          msg +="PLEASE CHOOSE 3 POPS <br>"
          end
         if custom_counter !=3
          msg +="PLEASE CHOOSE 3 MENU ITEMS<br>"
         end
     elsif menu_item_name == "Custom Meal 3"
         if pop_counter !=4
           msg += "PLEASE CHOOSE 4 POPS<br>"
         end
         if custom_counter != 4
          msg +="PLEASE CHOOSE 4 MENU ITEMS<br>"
         end
     elsif menu_item_name == "Pizza Meal"
         if pizza_counter != 2
           msg += "PLEASE CHOOSE 2 MEDIUM  PIZZAS<br>"
         end
         if pop_counter != 4
          msg +="PLEASE CHOOSE 4 POPS<br>"
         end
         if chip_counter != 4
          msg +="PLEASE CHOOSE 4 CHIPS<br>"
         end
     elsif menu_item_name == "Chicken Finger Meal"
        if pop_counter != 4
          msg +="PLEASE CHOOSE 4 POPS<br>"
        end
    elsif menu_item_name == "Wing Meal"
        if pop_counter != 4
         msg +="PLEASE CHOOSE 4 POPS<br>"
        end
    elsif menu_item_name == "Hot Dog Meal"
        if a6dog_counter != 1
          #msg += "PLEASE CHOOSE 6 HOT DOGS<br>"
          msg = "PLEASE SELECT THE NUMBER OF VEGETARIAN/BEEF HOTDOGS <br>"
        end  
        if pop_counter != 4
         msg +="PLEASE CHOOSE 4 POPS<br>"
        end
        if chip_counter != 4
         msg +="PLEASE CHOOSE 4 CHIPS<br>"
        end
     #else
     
       # if pop_counter > 4
       #  msg += "THE MAXIMUM NUMBER OF POPS IS 4"
       # elsif chip_counter > 4
       #  msg += "THE MAXIMUM NUMBER OF CHIPS IS 4"
       # elsif pizza_counter > 2
       #  msg += "THE MAXIMUM NUMBER OF PIZZAS IS 2"
       # elsif dog_counter > 6
       #  msg += "THE MAXIMUM NUMBER OF HOT DOGS IS 6"
       #  end
       # # elsif sauce_counter > 1 || chicken_wings_counter > 1
       # #  msg += "PLEASE CHOOSE ONE SAUCE ONLY"
       # # end
     end
     msg
    end

end
