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

ActiveRecord::Schema[7.1].define(version: 2024_09_17_104108) do
  create_table "about_us", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.text "content"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "form_responses", force: :cascade do |t|
    t.integer "form_id", null: false
    t.integer "user_id", null: false
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.date "date"
    t.text "details"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_responses_on_form_id"
    t.index ["user_id"], name: "index_form_responses_on_user_id"
  end

  create_table "forms", force: :cascade do |t|
    t.text "content"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.datetime "date"
    t.text "details"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.string "month"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "complaint_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_id"], name: "index_responses_on_complaint_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: true
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "complaints", "users"
  add_foreign_key "form_responses", "forms"
  add_foreign_key "form_responses", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "responses", "complaints"
end
