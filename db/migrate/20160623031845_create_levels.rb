class CreateLevels < ActiveRecord::Migration
  def change
    create_table "levels", id: false do |t|

      t.integer  "id",           limit: 4
      t.string "name",           limit: 24
      t.string "description",    limit: 56
      t.integer  "minutes",      limit: 4

    end

    execute %Q{ ALTER TABLE levels ADD PRIMARY KEY (id); }
  end
end
