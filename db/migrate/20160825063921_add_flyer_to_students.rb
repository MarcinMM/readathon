class AddFlyerToStudents < ActiveRecord::Migration
  def change
    add_column :students, :flyer_sent_date, :datetime
  end
end