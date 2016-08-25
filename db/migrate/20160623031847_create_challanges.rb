class CreateChallanges < ActiveRecord::Migration
  def change
    create_table "challanges", id: false do |t|
      t.integer  "id",           limit: 4
      t.string "description",    limit: 255
    end

    execute %Q{ ALTER TABLE challanges ADD PRIMARY KEY (id); }
  end
end
