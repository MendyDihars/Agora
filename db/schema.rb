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

ActiveRecord::Schema.define(version: 20170523130316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "user_skill_id"
    t.integer  "student_id"
    t.date     "happen_at"
    t.text     "message"
    t.date     "approved_at"
    t.date     "rejected_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["student_id"], name: "index_meetings_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_meetings_on_teacher_id", using: :btree
    t.index ["user_skill_id"], name: "index_meetings_on_user_skill_id", using: :btree
  end

  create_table "requested_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_requested_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_requested_skills_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_user_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.text     "bio"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "meetings", "user_skills"
  add_foreign_key "requested_skills", "skills"
  add_foreign_key "requested_skills", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
