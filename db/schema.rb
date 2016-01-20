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

ActiveRecord::Schema.define(version: 20160120202304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string   "uid",               default: "", null: false
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "image_url"
    t.integer  "vendor_id"
    t.string   "vendor_identifier"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "collections", ["uid"], name: "index_collections_on_uid", unique: true, using: :btree
  add_index "collections", ["vendor_id", "vendor_identifier"], name: "index_collections_on_vendor_id_and_vendor_identifier", using: :btree
  add_index "collections", ["vendor_id"], name: "index_collections_on_vendor_id", using: :btree

  create_table "transcript_statuses", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.integer  "progress",    default: 0,  null: false
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "transcript_statuses", ["name"], name: "index_transcript_statuses_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "uid",         default: "", null: false
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.string   "image_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "vendors", ["uid"], name: "index_vendors_on_uid", unique: true, using: :btree

end