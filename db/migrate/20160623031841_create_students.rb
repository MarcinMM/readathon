class CreateStudents < ActiveRecord::Migration
  def change
    create_table "students", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer  "avatar_id",           limit: 4, default: 0
      t.integer  "level_id",            limit: 4, default: 0
      t.integer  "teacher_id",          limit: 4
      t.string "code",                  limit: 10
      t.string "email",                 limit: 56
      t.string "first",                 limit: 56
      t.string "last",                  limit: 56

    end
  end
end
