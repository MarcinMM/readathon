class PledgeMailer < ApplicationMailer
  def email1 email, name, message, profile_bitly_url, student
    @name = name
    @message = message
    @profile_bitly_url = profile_bitly_url
    @student = student
    mail(to: email, subject: "Help support #{student.first}'s' read-a-thon")
  end

  def email2 emails, name, profile_bitly_url, student
    @name = name
    @profile_bitly_url = profile_bitly_url
    @student = student
    mail(to: emails, subject: "Help support #{student.first}'s' read-a-thon")
  end

  def email3 emails, message, student
    @message = message
    @student = student
    mail(to: emails, subject: "Help support #{student.first}'s' read-a-thon")
  end
end
