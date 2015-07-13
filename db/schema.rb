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

ActiveRecord::Schema.define(version: 20150702201315) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",               limit: 30
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "recurring_schedule"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "account_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "payments", ["account_id"], name: "index_payments_on_account_id"

  create_table "recurring_payments", force: :cascade do |t|
    t.integer  "account_id"
    t.text     "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recurring_payments", ["account_id"], name: "index_recurring_payments_on_account_id"

end
