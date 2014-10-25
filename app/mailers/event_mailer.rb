class EventMailer < ActionMailer::Base
  default from: "noreply@help.example.com"

  def event_mail(user)
    @user = user
    mail to: @user.email, subject: "Something happened at help.example.com"
  end
end