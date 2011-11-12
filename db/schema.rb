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

ActiveRecord::Schema.define(:version => 20111112200010) do

  create_table "categories", :force => true do |t|
    t.integer  "log_book_id", :null => false
    t.string   "name",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.integer "log_book_id", :null => false
    t.string  "name",        :null => false
    t.string  "notes"
  end

  create_table "games", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "log_book_id", :null => false
    t.string   "name",        :null => false
    t.string   "area"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_books", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "game_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes_entries", :force => true do |t|
    t.integer  "log_book_id", :null => false
    t.integer  "quest_id"
    t.text     "text",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "world_object_id", :null => false
    t.string   "name",            :null => false
    t.string   "data_type",       :null => false
    t.string   "display_type",    :null => false
    t.string   "lookup_value"
    t.integer  "integer_value"
    t.decimal  "decimal_value"
    t.datetime "datetime_value"
    t.boolean  "boolean_value"
    t.string   "string_value"
    t.text     "text_value"
  end

  create_table "quests", :force => true do |t|
    t.integer "log_book_id", :null => false
    t.string  "name",        :null => false
  end

  create_table "stats", :force => true do |t|
    t.integer  "character_id",   :null => false
    t.string   "name",           :null => false
    t.string   "data_type",      :null => false
    t.string   "display_type",   :null => false
    t.string   "lookup_value"
    t.integer  "integer_value"
    t.decimal  "decimal_value"
    t.datetime "datetime_value"
    t.boolean  "boolean_value"
    t.string   "string_value"
    t.text     "text_value"
  end

  create_table "users", :force => true do |t|
    t.string   "email",      :null => false
    t.string   "login",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "world_objects", :force => true do |t|
    t.integer  "log_book_id",    :null => false
    t.integer  "category_id",    :null => false
    t.integer  "location_id",    :null => false
    t.integer  "looted_from_id", :null => false
    t.string   "name",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
