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

ActiveRecord::Schema.define(version: 20151101101444) do

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
    t.string   "companyType", default: "", null: false
    t.string   "slug"
  end

  add_index "companies", ["companyCode"], name: "index_companies_on_companyCode", unique: true
  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true

  create_table "company_roles", force: :cascade do |t|
    t.string   "role",       default: "", null: false
    t.integer  "company_id",              null: false
    t.integer  "person_id",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

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
    t.string   "slug"
  end

  add_index "people", ["slug"], name: "index_people_on_slug", unique: true

  create_table "products", force: :cascade do |t|
    t.string   "code",          default: "",  null: false
    t.string   "name",          default: "",  null: false
    t.string   "unit",          default: "",  null: false
    t.decimal  "price",         default: 0.0, null: false
    t.decimal  "bargain_price", default: 0.0, null: false
    t.date     "end_date"
    t.integer  "buffer_stock",  default: 0,   null: false
    t.integer  "stock",         default: 0,   null: false
    t.decimal  "cost",          default: 0.0, null: false
    t.text     "description",   default: "",  null: false
    t.text     "remark",        default: "",  null: false
    t.string   "image"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "company_id"
    t.string   "slug"
  end

  add_index "products", ["code"], name: "index_products_on_code", unique: true
  add_index "products", ["company_id"], name: "index_products_on_company_id"
  add_index "products", ["name"], name: "index_products_on_name", unique: true
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true

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
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

end
