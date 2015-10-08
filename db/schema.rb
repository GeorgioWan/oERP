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

ActiveRecord::Schema.define(version: 20151002094846) do

  create_table "companies", force: :cascade do |t|
    t.string   "companyCode", default: "", null: false
    t.string   "nameFull",    default: "", null: false
    t.string   "nameShort",   default: "", null: false
    t.string   "level",       default: "", null: false
    t.string   "phone",       default: "", null: false
    t.string   "fax",         default: "", null: false
    t.string   "taxId",       default: "", null: false
    t.string   "email",       default: "", null: false
    t.string   "address",     default: "", null: false
    t.text     "remark",      default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "companies", ["companyCode"], name: "index_companies_on_companyCode", unique: true

  create_table "company_roles", force: :cascade do |t|
    t.string   "role",       default: "", null: false
    t.integer  "company_id",              null: false
    t.integer  "person_id",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "job_titles", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "job_titles", ["title"], name: "index_job_titles_on_title", unique: true

  create_table "people", force: :cascade do |t|
    t.string   "nameFull",   default: "", null: false
    t.string   "nameShort",  default: "", null: false
    t.string   "phone",      default: "", null: false
    t.string   "email",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone"
    t.integer  "sex",                    default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
