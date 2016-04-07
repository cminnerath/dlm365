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

ActiveRecord::Schema.define(version: 20160407031638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.string   "imdb_id"
    t.integer  "year"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "release_date"
    t.string   "runtime"
    t.string   "poster_url"
    t.text     "tagline"
    t.text     "plot"
    t.string   "certification"
    t.float    "rating"
    t.text     "actors"
    t.text     "directors"
    t.text     "writers"
    t.text     "genres"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "films_minis", id: false, force: :cascade do |t|
    t.integer "mini_id", null: false
    t.integer "film_id", null: false
  end

  add_index "films_minis", ["film_id", "mini_id"], name: "index_films_minis_on_film_id_and_mini_id", using: :btree
  add_index "films_minis", ["mini_id", "film_id"], name: "index_films_minis_on_mini_id_and_film_id", using: :btree

  create_table "minis", force: :cascade do |t|
    t.string   "film_title"
    t.string   "imdb_id"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date_viewed"
    t.integer  "user_id"
  end

  add_index "minis", ["user_id"], name: "index_minis_on_user_id", using: :btree

  create_table "mobile_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "mobile_users", ["email"], name: "index_mobile_users_on_email", unique: true, using: :btree
  add_index "mobile_users", ["reset_password_token"], name: "index_mobile_users_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
