class AddEmail2ToStudents < ActiveRecord::Migration
  def change
    add_column :students, :email2, :string, limit: 256
  end
end
