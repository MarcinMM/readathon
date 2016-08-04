class AddUserToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer, limit: 4

  end
end
