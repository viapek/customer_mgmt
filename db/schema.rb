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

ActiveRecord::Schema.define(version: 20150903182151) do

  create_table "admin_users", force: :cascade do |t|
    t.integer  "customer_id",     limit: 4
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["customer_id"], name: "index_admin_users_on_customer_id", using: :btree
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", using: :btree

  create_table "appointment_logs", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.datetime "date"
    t.boolean  "chargeable",                default: true
    t.text     "notes",       limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "appointment_logs", ["customer_id"], name: "index_appointment_logs_on_customer_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "day",         limit: 4
    t.time     "start_time"
    t.time     "finish_time"
    t.string   "location",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.string   "phone",      limit: 11
    t.string   "email",      limit: 100
    t.boolean  "current"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "customer_id",      limit: 4
    t.datetime "date"
    t.integer  "amount",           limit: 4
    t.integer  "classes_paid_for", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id", using: :btree

  add_foreign_key "appointment_logs", "customers"
  add_foreign_key "appointments", "customers"
  add_foreign_key "payments", "customers"
end
