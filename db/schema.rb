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

ActiveRecord::Schema[7.1].define(version: 2024_01_28_065329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.string "pickup_address"
    t.string "drop_address"
    t.string "description"
    t.string "contact"
    t.date "pickup_date"
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "client_name"
    t.index ["service_id"], name: "index_reservations_on_service_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.decimal "min_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "role", default: "user"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservations", "services"
  add_foreign_key "reservations", "users"
  add_foreign_key "services", "users"
end
