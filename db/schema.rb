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

ActiveRecord::Schema.define(version: 20160825063919) do

  create_table "avatars", force: :cascade do |t|
    t.integer "level_id", limit: 4
    t.string  "category", limit: 24
  end

  create_table "challanges", force: :cascade do |t|
    t.string "description", limit: 255
  end

  create_table "challanges_students", id: false, force: :cascade do |t|
    t.integer "challange_id", limit: 4, null: false
    t.integer "student_id",   limit: 4, null: false
  end

  add_index "challanges_students", ["challange_id", "student_id"], name: "index_challanges_students_on_challange_id_and_student_id", using: :btree
  add_index "challanges_students", ["student_id", "challange_id"], name: "index_challanges_students_on_student_id_and_challange_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string  "name",        limit: 24
    t.string  "description", limit: 255
    t.integer "minutes",     limit: 4
  end

  create_table "pledges", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id", limit: 4
    t.string   "name",       limit: 24
    t.string   "email",      limit: 36
    t.string   "ptype",      limit: 10
    t.decimal  "amount",                   precision: 6, scale: 2
    t.decimal  "min_amt",                  precision: 6, scale: 2
    t.decimal  "max_amt",                  precision: 6, scale: 2
    t.text     "message",    limit: 65535
  end

  create_table "readlogs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "day"
    t.integer  "teacher_id", limit: 4
    t.integer  "student_id", limit: 4
    t.integer  "minutes",    limit: 4
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "avatar_id",  limit: 4,  default: 0
    t.integer  "level_id",   limit: 4,  default: 0
    t.integer  "teacher_id", limit: 4
    t.string   "code",       limit: 10
    t.string   "email",      limit: 56
    t.string   "first",      limit: 56
    t.string   "last",       limit: 56
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
    t.string   "first",      limit: 56
    t.string   "last",       limit: 56
    t.integer  "grade",      limit: 1,  default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
