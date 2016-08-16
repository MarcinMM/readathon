class CreatePledges < ActiveRecord::Migration
  def change
    create_table "pledges", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer  "student_id",   limit: 4
      t.string "name",           limit: 24
      t.string "email",          limit: 36
      t.string "ptype",           limit: 10
      t.integer  "amount",       limit: 4
      t.integer  "min_amt",      limit: 4
      t.integer  "max_amt",      limit: 4
      t.text "message"

    end
  end
end
