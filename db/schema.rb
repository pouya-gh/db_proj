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

ActiveRecord::Schema.define(version: 20140702181157) do

  create_table "ac_relationships", force: true do |t|
    t.integer  "account_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", primary_key: "acct_no", force: true do |t|
    t.integer  "balance"
    t.string   "type"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", primary_key: "code", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", primary_key: "branch_no", force: true do |t|
    t.string   "address"
    t.integer  "bank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", primary_key: "ssn", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["auth_token"], name: "index_employees_on_auth_token", unique: true
  add_index "employees", ["email"], name: "index_employees_on_email", unique: true

  create_table "lc_relationships", force: true do |t|
    t.integer  "loan_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", primary_key: "loan_no", force: true do |t|
    t.integer  "amount"
    t.string   "type"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
