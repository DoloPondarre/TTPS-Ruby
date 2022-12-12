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

ActiveRecord::Schema[7.0].define(version: 2022_12_11_123347) do
  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.integer "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "day", default: 0
    t.time "hourI"
    t.time "hourF"
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_schedules_on_branch_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.date "date"
    t.string "reason"
    t.string "state"
    t.string "comment"
    t.integer "client_id", null: false
    t.integer "staff_id"
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "time"
    t.index ["branch_id"], name: "index_shifts_on_branch_id"
    t.index ["client_id"], name: "index_shifts_on_client_id"
    t.index ["staff_id"], name: "index_shifts_on_staff_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role_id", null: false
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "schedules", "branches"
  add_foreign_key "shifts", "branches"
  add_foreign_key "shifts", "users", column: "client_id"
  add_foreign_key "shifts", "users", column: "staff_id"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "roles"
end
