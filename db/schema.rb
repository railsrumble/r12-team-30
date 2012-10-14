# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121014210141) do

  create_table "opening_times", :force => true do |t|
    t.integer  "store_id"
    t.integer  "weekday"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "opening_times", ["store_id"], :name => "index_opening_times_on_store_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], :name => "index_order_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "store_id"
    t.datetime "pickup_time"
    t.string   "status"
    t.string   "customer_note"
    t.string   "store_note"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["store_id"], :name => "index_orders_on_store_id"

  create_table "product_taxonomies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "store_id"
    t.integer  "product_taxonomy_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "products", ["product_taxonomy_id"], :name => "index_products_on_product_taxonomy_id"
  add_index "products", ["store_id"], :name => "index_products_on_store_id"

  create_table "store_pictures", :force => true do |t|
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  add_index "store_pictures", ["store_id"], :name => "index_store_pictures_on_store_id"

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.string   "short_description"
    t.string   "contact_info"
    t.string   "currency"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "owner_id"
    t.string   "logo"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
  end

  add_index "stores", ["owner_id"], :name => "index_stores_on_owner_id"
  add_index "stores", ["slug"], :name => "index_stores_on_slug", :unique => true

  create_table "templates", :force => true do |t|
    t.string   "template"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "themes", :force => true do |t|
    t.string   "palette"
    t.string   "font"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "store_id"
    t.integer  "template_id"
  end

  add_index "themes", ["store_id"], :name => "index_themes_on_store_id"
  add_index "themes", ["template_id"], :name => "index_themes_on_template_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "real_name"
    t.integer  "sent_orders"
    t.integer  "completed_orders"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
