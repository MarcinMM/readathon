desc "Generate Fake Pledges"
task :generate_fake_pledges => :environment do

  Student.all.each do |student|
    pledge = Pledge.new
    pledge.ptype = 'hourly'
    pledge.student_id = student.id
    pledge.name = "test"
    pledge.message = "test message"
    pledge.amount = Random.rand(11)

    pledge.min_amt = 10 + Random.rand(11)
    pledge.max_amt = 30 + Random.rand(11)

    pledge.save
  end

end