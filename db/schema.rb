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

ActiveRecord::Schema.define(version: 20151018153651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinemas", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "webpage"
    t.string   "promotion_name"
    t.string   "promotion_desc"
    t.boolean  "enabled"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cinemas", ["name"], name: "index_cinemas_on_name", unique: true, using: :btree

  create_table "films", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "films", ["cinema_id"], name: "index_films_on_cinema_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "films", "cinemas"
end
