class CreatePledges < ActiveRecord::Migration
  def change
    create_table "pledges", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"

      t.integer "student_id",   limit: 4
      t.string "name",          limit: 24
      t.decimal "amount",       precision: 6, scale: 2
      t.text "message"
      t.decimal "col_amt",      precision: 6, scale: 2
      t.decimal "col_fee",      precision: 6, scale: 2
      t.datetime "col_date"

    end
  end
end
