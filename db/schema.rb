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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140204140828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_messages", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.integer  "sound",          default: 0,             null: false
    t.integer  "priority",       default: 0,             null: false
    t.string   "url"
    t.string   "url_title"
    t.integer  "status",         default: 0,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message_errors"
    t.string   "app_pic",        default: "default.png", null: false
    t.integer  "expire"
    t.integer  "retry"
    t.string   "message_hash",                           null: false
  end

  add_index "api_messages", ["status"], name: "index_api_messages_on_status", using: :btree

end
