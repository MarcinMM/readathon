class CreateJoinTableChallengesStudents < ActiveRecord::Migration
  def change
    create_join_table :challenges, :students do |t|
      t.index [:challenge_id, :student_id]
      t.index [:student_id, :challenge_id]
    end
  end
end
