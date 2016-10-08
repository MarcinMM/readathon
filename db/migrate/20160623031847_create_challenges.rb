class CreateChallenges < ActiveRecord::Migration
  def change
    create_table "challenges", id: false do |t|
      t.integer  "id",           limit: 4
      t.string "description",    limit: 255
    end

    execute %Q{ ALTER TABLE challenges ADD PRIMARY KEY (id); }
  end
end
