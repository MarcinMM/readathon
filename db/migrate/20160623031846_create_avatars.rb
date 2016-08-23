class CreateAvatars < ActiveRecord::Migration
  def change
    create_table "avatars", id: false do |t|

      t.integer  "id",           limit: 4
      t.integer  "level_id",     limit: 4
      t.string "category",       limit: 24

    end

    execute %Q{ ALTER TABLE avatars ADD PRIMARY KEY (id); }
  end
end
