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

ActiveRecord::Schema[7.0].define(version: 2024_04_25_095651) do
  create_table "issues", force: :cascade do |t|
    t.text "description"
    t.integer "task_id"
    t.string "status"
    t.text "resolution_explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.integer "project_id"
    t.date "estimated_completion_date"
    t.text "descriptive_name"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_order"
    t.date "estimated_start_date"
    t.decimal "milestone_cost"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.decimal "budget_amount"
    t.text "project_description"
    t.date "estimated_completion_date"
    t.string "status"
    t.text "skillset_requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "budget_amount_used"
  end

  create_table "user_stories", force: :cascade do |t|
    t.integer "milestone_id"
    t.text "descriptive_name"
    t.integer "membership_id"
    t.integer "project_id"
    t.date "estimated_completion_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_order"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "phone_no"
    t.string "title"
    t.string "access_role"
    t.string "first_name"
    t.string "last_name"
    t.text "skillset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isadmin"
    t.string "whereis", default: "project_list"
    t.text "avatar_loc"
    t.decimal "price_per_hour"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
