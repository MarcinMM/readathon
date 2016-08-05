desc "Setup Teacher"
task :setup_teacher => :environment do

  puts "You will be prompted to enter an email address and password for the new admin"
  puts "Enter an email address:"
  email = STDIN.gets
  puts "Enter a password:"
  password = STDIN.gets
  unless email.strip!.blank? || password.strip!.blank?
    if User.create!(email: email, password: password, teacher: true)
      puts "The teacher was created successfully."
    else
      puts "Sorry, the teacher was not created!"
    end
  end

end