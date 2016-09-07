class PledgeMailer < ApplicationMailer
  def email1 email, name, message, profile_bitly_url, student
    @name = name
    @message = message
    @profile_bitly_url = profile_bitly_url
    @student = student
    mail(from: @student.email, to: email, subject: "Help support #{student.first}'s' read-a-thon")
  end
end
