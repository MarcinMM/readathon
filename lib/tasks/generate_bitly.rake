desc "Generate Bitly"
task :generate_bitly => :environment do

  Student.where("bitly_profile is null or bitly_pledge is null").each do |student|
    student.gen_bitly
  end

end