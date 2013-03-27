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

ActiveRecord::Schema.define(:version => 20130311161949) do

  create_table "action_names", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "controller_actions", :force => true do |t|
    t.string   "name"
    t.integer  "controller_name_id"
    t.integer  "action_name_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "controller_actions", ["action_name_id"], :name => "index_controller_actions_on_action_name_id"
  add_index "controller_actions", ["controller_name_id"], :name => "index_controller_actions_on_controller_name_id"

  create_table "controller_names", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interactions", :force => true do |t|
    t.integer  "controller_action_id"
    t.integer  "role_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "interactions", ["controller_action_id"], :name => "index_interactions_on_controller_action_id"
  add_index "interactions", ["role_id"], :name => "index_interactions_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
