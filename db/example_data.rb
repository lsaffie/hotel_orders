module FixtureReplacement
  
  attributes_for :menu do |m|
    m.name = String.random
  end
  
  attributes_for :menu_item do |i|
    i.name = String.random
    i.type = ''
    i.price =  2.50
    i.description = String.random
  end
  
  attributes_for :foodstuff do |f|
    f.name = String.random
  end
  
  attributes_for :option do |o|
    o.name = String.random
  end
  
  attributes_for :line_item do |l|
  end
  
  attributes_for :choice do |c|
  end
  
  attributes_for :order do |o|
    o.guest_name = 'Smith'
    o.room_number = 32
    o.arrival_date = 1.week.ago
    o.order_status = 'delivered'
    o.confirmation_number = 123456
    o.telephone = '416-822-4977'
    o.email = 'foo@bar.com'
    o.updated_by = 'wha?'
    o.total_price = 2.50
    o.delivery_time = 1.week.since
  end
end