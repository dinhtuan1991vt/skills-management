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

ActiveRecord::Schema.define(version: 20150618145920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assesses", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "score"
    t.integer "user_id"
    t.integer "supervisor_id"
  end

  add_index "assesses", ["skill_id"], name: "index_assesses_on_skill_id", using: :btree
  add_index "assesses", ["user_id"], name: "index_assesses_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string  "name"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string  "name"
    t.string  "status"
    t.string  "string"
    t.date    "from_date"
    t.date    "to_date"
    t.integer "user_id"
  end

  add_index "qualifications", ["user_id"], name: "index_qualifications_on_user_id", using: :btree

  create_table "ranks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks_skills", id: false, force: :cascade do |t|
    t.integer "rank_id"
    t.integer "skill_id"
  end

  add_index "ranks_skills", ["rank_id"], name: "index_ranks_skills_on_rank_id", using: :btree
  add_index "ranks_skills", ["skill_id"], name: "index_ranks_skills_on_skill_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "skill_categories", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "skill_category_id"
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "teams_skills", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "skill_id"
  end

  add_index "teams_skills", ["skill_id"], name: "index_teams_skills_on_skill_id", using: :btree
  add_index "teams_skills", ["team_id"], name: "index_teams_skills_on_team_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "location_id"
    t.string   "first_name"
    t.string   "sur_name"
    t.boolean  "status"
    t.integer  "skill_set"
    t.integer  "rank_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["rank_id"], name: "index_users_on_rank_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "users_skills", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  add_index "users_skills", ["skill_id"], name: "index_users_skills_on_skill_id", using: :btree
  add_index "users_skills", ["user_id"], name: "index_users_skills_on_user_id", using: :btree

  add_foreign_key "qualifications", "users"
  add_foreign_key "ranks_skills", "ranks"
  add_foreign_key "ranks_skills", "skills"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "teams_skills", "skills"
  add_foreign_key "teams_skills", "teams"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "ranks"
  add_foreign_key "users", "teams"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
