class CreatePledges < ActiveRecord::Migration
  def change
    create_table "pledges", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer "student_id",   limit: 4
      t.string "name",          limit: 24
      t.decimal "amount",       precision: 6, scale: 2
      t.text "message"

    end
  end
end
