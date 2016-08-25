class CreateJoinTableChallangesStudents < ActiveRecord::Migration
  def change
    create_join_table :challanges, :students do |t|
      t.index [:challange_id, :student_id]
      t.index [:student_id, :challange_id]
    end
  end
end
