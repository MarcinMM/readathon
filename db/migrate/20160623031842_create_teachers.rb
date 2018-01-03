class CreateTeachers < ActiveRecord::Migration
  def change
    create_table "teachers", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.string "name",                 limit: 56
      t.integer  "grade",              limit: 1,   default: 0
      t.integer "minutes",             limit: 4
      t.integer "total_students",      limit: 4
      t.integer "reading_goal",        limit: 4

    end
  end
end
