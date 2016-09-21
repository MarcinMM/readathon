desc "Add 15 mins to table"
task :add_15 => :environment do

  puts "Adding 15 mintues"

  student = Student.find(1)
  student.student_minutes_update 15

end