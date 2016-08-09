class CreateTeachers < ActiveRecord::Migration
  def change
    create_table "teachers", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer  "user_id",             limit: 4
      t.string "first",                 limit: 56
      t.string "last",                  limit: 56
      t.integer  "grade",               limit: 1,   default: 0

    end
  end
end