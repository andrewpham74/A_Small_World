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

ActiveRecord::Schema.define(version: 20141216230523) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interestizations", force: true do |t|
    t.integer  "interest_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pin_id"
  end

  add_index "interestizations", ["interest_id"], name: "index_interestizations_on_interest_id"
  add_index "interestizations", ["user_id"], name: "index_interestizations_on_user_id"

  create_table "interests", force: true do |t|
    t.string "name"
  end

  create_table "pins", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "continenetname"
    t.string   "continent"
    t.string   "country"
    t.string   "interest"
    t.text     "source"
  end

  add_index "pins", ["user_id"], name: "index_pins_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price_in_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "download_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.integer  "amount"
    t.string   "description"
    t.string   "currency"
    t.string   "customer_id"
    t.string   "card"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "user_countryname"
    t.string   "user_continentname"
    t.string   "user_interest"
    t.string   "user_city"
    t.string   "user_talent"
    t.text     "countries_to_see",       limit: 255
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
