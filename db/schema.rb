# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 60) do

  create_table "cart_items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
  end

  create_table "choices", :force => true do |t|
    t.string  "name"
    t.integer "line_item_id"
    t.integer "foodstuff_id"
    t.integer "quantity"
    t.string  "foodstuff_name"
    t.integer "foodstuff_quantity"
  end

  create_table "customized_menus", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foodstuffs", :force => true do |t|
    t.string  "name"
    t.integer "quantity"
    t.string  "helper_text"
  end

  create_table "foodstuffs_menu_items", :id => false, :force => true do |t|
    t.integer "foodstuff_id"
    t.integer "menu_item_id"
  end

  create_table "line_items", :force => true do |t|
    t.string  "options"
    t.integer "quantity"
    t.float   "price"
    t.string  "name"
    t.integer "menu_item_id"
    t.integer "order_id"
    t.integer "foodstuff_quantity"
  end

  create_table "menu_items", :force => true do |t|
    t.string  "name"
    t.string  "type"
    t.integer "menu_id"
    t.float   "price"
    t.text    "description"
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "menus", :force => true do |t|
    t.string "name"
  end

  create_table "options", :force => true do |t|
    t.string  "name"
    t.string  "foodstuff_id"
    t.integer "quantity_allowed"
  end

  create_table "orders", :force => true do |t|
    t.string   "guest_name"
    t.string   "room_number"
    t.date     "arrival_date",        :limit => 255
    t.string   "order_status",                       :default => "Incomplete"
    t.string   "confirmation_number"
    t.string   "telephone"
    t.string   "email"
    t.date     "created_on"
    t.float    "total_price",                        :default => 0.0
    t.string   "updated_by"
    t.string   "delivery_time"
    t.datetime "updated_on"
    t.date     "delivery_date"
    t.datetime "delivery_datetime"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
