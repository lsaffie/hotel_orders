class CartItem 
	
	attr_reader :menu_item, :price, :options, :quantities, :foodstuff_quantity
	
	def initialize(menu_item, price, options, quantities, foodstuff_quantity)
		@menu_item = menu_item
		@price = price
		@options = options
    @quantities = quantities
    @foodstuff_quantity = foodstuff_quantity
	end
	
	def increment_quantity(count,price)
		@quantity += count
		@price = price
	end
	
	def name
		@menu_item.name
	end
	
	def price
		@menu_item * @quantity
	end
	
end
