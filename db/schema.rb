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

ActiveRecord::Schema.define(version: 20160825063924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.integer "level_id"
    t.string  "category", limit: 24
  end

  create_table "challenges", force: :cascade do |t|
    t.string "description", limit: 255
  end

  create_table "challenges_students", id: false, force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "student_id",   null: false
  end

  add_index "challenges_students", ["challenge_id", "student_id"], name: "index_challenges_students_on_challenge_id_and_student_id", using: :btree
  add_index "challenges_students", ["student_id", "challenge_id"], name: "index_challenges_students_on_student_id_and_challenge_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string  "name",        limit: 24
    t.string  "description", limit: 255
    t.integer "minutes"
  end

  create_table "pledges", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.string   "name",             limit: 24
    t.decimal  "amount",                      precision: 6, scale: 2
    t.text     "message"
    t.datetime "email_sent_date"
    t.datetime "email_click_date"
  end

  create_table "readlogs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "day"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.integer  "minutes"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "avatar_id",                   default: 0
    t.integer  "level_id",                    default: 0
    t.integer  "teacher_id"
    t.string   "code",            limit: 10
    t.string   "first",           limit: 56
    t.string   "last",            limit: 56
    t.string   "bitly_profile",   limit: 256
    t.string   "bitly_pledge",    limit: 256
    t.datetime "flyer_sent_date"
    t.datetime "accepted_date"
    t.string   "email2",          limit: 256
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first",      limit: 56
    t.string   "last",       limit: 56
    t.integer  "grade",      limit: 2,  default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
