include FixtureReplacement


puts 'loading fixtures...'

best_option = new_option(:name => 'poached') # we'll need this later

# Create some foodstuffs
home_fries = new_foodstuff(:name => 'Home fries')
eggs       = new_foodstuff(:name => 'Eggs', :options => 
                           [new_option(:name => 'over_easy'),
                            new_option(:name => 'over_hard'),
                            new_option(:name => 'scrambled'),
                            best_option])
bacon      = new_foodstuff(:name => 'Bacon', :options =>
                           [new_option(:name => 'well done'),
                            new_option(:name => 'rare')])
bagel      = new_foodstuff(:name => 'Bagel')
fruit      = new_foodstuff(:name => 'Fruit', :options =>
                           [new_option(:name => 'grapefruit'),
                            new_option(:name => 'banana')])
# 
# Assemble them into menu_items
hearty_breakfast      = new_menu_item(:name => 'Hearty Breakfast',
                                 :foodstuffs => [eggs, home_fries, bacon])
continental_breakfast = new_menu_item(:name => 'Continental Breakfast',
                                      :foodstuffs => [bagel, fruit])
                                      
# We have to stub over the validation call here so we don't
# get tied up in complexity trying to get fixtures working along with
# attachment_fu
# TODO get fixtures working with attachment_fu                                      
hearty_breakfast.instance_eval { def valid?; true end}
continental_breakfast.instance_eval { def valid?; true end}



# Now add them to the menu                                      
new_menu(:name => 'Breakfast',
         :menu_items => [hearty_breakfast, continental_breakfast]).save!

# Create ourselves a new choice to match one of our options
clever_choice = new_choice()

# Now lets create a line_item to use with our order         
hearty_breakfast_line_item = new_line_item(:menu_item_id => hearty_breakfast.id,
                                           :choices => [clever_choice])
                                     
# And save an order                                           
order = new_order(:line_items => [hearty_breakfast_line_item]).save!