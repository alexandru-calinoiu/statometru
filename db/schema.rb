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

ActiveRecord::Schema.define(:version => 20110416181737) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "rate",        :default => 0
    t.integer  "rate_count",  :default => 0
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.float    "rating",      :default => 0.0
    t.integer  "rate_count",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "location_id"
  end

  add_index "institutions", ["category_id"], :name => "index_institutions_on_category_id"
  add_index "institutions", ["location_id"], :name => "index_institutions_on_location_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_type"
    t.integer  "location_id"
  end

  add_index "locations", ["location_id"], :name => "index_locations_on_location_id"

  create_table "rates", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "institution_id"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "identifier"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["identifier"], :name => "index_users_on_identifier"

end
