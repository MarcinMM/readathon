class CreateProfiles < ActiveRecord::Migration
  def change
    create_table "profiles", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer  "avatar_id",           limit: 4
      t.integer  "level_id",            limit: 4
      t.string "code",                  limit: 10
      t.string "email",                 limit: 56
      t.string "first",                 limit: 56
      t.string "last",                  limit: 56
      t.integer  "grade",               limit: 1,   default: 0
      t.string "teacher",               limit: 56

    end
  end
end
