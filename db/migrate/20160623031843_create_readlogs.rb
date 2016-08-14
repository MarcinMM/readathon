class CreateReadlogs < ActiveRecord::Migration
  def change
    create_table "readlogs", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.datetime "day"
      t.integer  "teacher_id",    limit: 4
      t.integer "student_id",     limit: 4
      t.integer "minutes",        limit: 4

    end
  end
end
