class AddAcceptedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :accepted_date, :datetime
  end
end