class AddBitlyToStudents < ActiveRecord::Migration
  def change
    add_column :students, :bitly_profile, :string, limit: 256
    add_column :students, :bitly_pledge, :string, limit: 256
  end
end
