class GeneralMailer < ApplicationMailer

  def welcome_flyer student
    @student = student
    to = student.email2.nil? ? student.email : "#{student.email}, #{student.email2}"
    mail(to: to, subject: "The Richmond Read-A-Thon is almost over!")
  end

end
