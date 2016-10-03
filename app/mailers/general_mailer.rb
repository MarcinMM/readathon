class GeneralMailer < ApplicationMailer

  def welcome_flyer student
    @student = student
    mail(to: student.email, subject: "#{student.first} welcome to the Richmond Read-A-Thon")
  end

end
