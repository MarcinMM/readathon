desc "Generate Bitly"
task :generate_bitly => :environment do

  [167, 636, 604, 12].each do |id|
    student = Student.find id
    p "-> #{student.first} #{student.last}"
    student.gen_bitly
  end

end