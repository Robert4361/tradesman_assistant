# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_30_141136) do
  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.integer "pid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "bill_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_items_on_bill_id"
    t.index ["service_id"], name: "index_bill_items_on_service_id"
  end

  create_table "bills", force: :cascade do |t|
    t.date "date"
    t.boolean "status"
    t.integer "discount"
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bills_on_client_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "post_number"
    t.string "city"
    t.integer "pid"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_measurements_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "measurement_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measurement_id"], name: "index_services_on_measurement_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "business_name", null: false
    t.string "address", null: false
    t.integer "post_number", null: false
    t.string "city", null: false
    t.integer "pid", null: false
    t.string "iban", null: false
    t.text "business_description", null: false
    t.integer "bank_id", null: false
    t.boolean "admin", default: false
    t.boolean "activated", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_users_on_bank_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bill_items", "bills"
  add_foreign_key "bill_items", "services"
  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "measurements", "users"
  add_foreign_key "services", "measurements"
  add_foreign_key "services", "users"
  add_foreign_key "users", "banks"
end
