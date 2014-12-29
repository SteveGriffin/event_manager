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

ActiveRecord::Schema.define(version: 20141229174342) do

  create_table "attendees", force: true do |t|
    t.boolean  "volunteer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "paid"
    t.boolean  "private"
    t.text     "description"
    t.text     "document"
    t.integer  "event_cap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "plan_type"
    t.string   "plan_description"
    t.decimal  "price"
    t.boolean  "active"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "active"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
