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

ActiveRecord::Schema.define(version: 20161111211140) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "ads", force: :cascade do |t|
    t.integer  "campaign_id",           limit: 4
    t.string   "title",                 limit: 255
    t.text     "description",           limit: 65535
    t.integer  "type",                  limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "ad_image_file_name",    limit: 255
    t.string   "ad_image_content_type", limit: 255
    t.integer  "ad_image_file_size",    limit: 4
    t.datetime "ad_image_updated_at"
  end

  add_index "ads", ["campaign_id"], name: "index_ads_on_campaign_id", using: :btree

  create_table "apikeys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apikeys", ["access_token"], name: "index_apikeys_on_access_token", unique: true, using: :btree
  add_index "apikeys", ["user_id"], name: "index_apikeys_on_user_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "division_id",      limit: 4
    t.integer  "user_id",          limit: 4
    t.date     "appointment_date"
    t.time     "appointment_time"
    t.string   "detail",           limit: 255
    t.integer  "status",           limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "budget",      limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cats", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "key",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "divisions", force: :cascade do |t|
    t.integer  "main",                limit: 4
    t.integer  "for",                 limit: 4,     default: 1
    t.text     "description",         limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "fences", force: :cascade do |t|
    t.integer  "ad_id",      limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.float    "radius",     limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "fences", ["ad_id"], name: "index_fences_on_ad_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "staff_divisions", force: :cascade do |t|
    t.integer  "staff_id",    limit: 4
    t.integer  "division_id", limit: 4
    t.string   "summary",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.date     "date_of_birth"
    t.text     "description",   limit: 65535
    t.integer  "age",           limit: 4
    t.string   "email",         limit: 255
    t.string   "phone_number",  limit: 255
    t.string   "address",       limit: 255
    t.boolean  "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  create_table "sub_sub_categories", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.integer  "sub_category_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "sub_sub_categories", ["sub_category_id"], name: "index_sub_sub_categories_on_sub_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "email",         limit: 255
    t.date     "date_of_birth"
    t.string   "gender",        limit: 255
    t.integer  "age",           limit: 4
    t.string   "password",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "date_of_birth", limit: 255
    t.integer  "age",           limit: 4
    t.string   "email",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "ads", "campaigns"
  add_foreign_key "fences", "ads"
  add_foreign_key "locations", "users"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "sub_sub_categories", "sub_categories"
end
