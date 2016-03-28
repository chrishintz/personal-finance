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

ActiveRecord::Schema.define(version: 20160327223029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "net_worth_progresses", force: :cascade do |t|
    t.integer  "assets"
    t.integer  "liabilities"
    t.integer  "networth"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "net_worths", force: :cascade do |t|
    t.integer  "checking_account"
    t.integer  "savings_account"
    t.integer  "four_o_one_k"
    t.integer  "roth_ira"
    t.integer  "other_iras"
    t.integer  "five_twenty_nine"
    t.integer  "stocks"
    t.integer  "bonds"
    t.integer  "other_investments"
    t.integer  "pension"
    t.integer  "primary_residence"
    t.integer  "other_real_estate"
    t.integer  "car"
    t.integer  "life_insurance"
    t.integer  "other_assets"
    t.integer  "real_estate_mortgages"
    t.integer  "student_loans"
    t.integer  "car_loans"
    t.integer  "credit_card_debt"
    t.integer  "consumer_loans"
    t.integer  "unpaid_taxes"
    t.integer  "money_owned_to_others"
    t.integer  "other_liabilities"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.date     "dob"
    t.boolean  "married"
    t.integer  "income"
    t.string   "spouse_first_name"
    t.string   "spouse_last_name"
    t.integer  "spouse_income"
    t.integer  "other_income"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "spouse_dob"
    t.string   "status"
  end

end
