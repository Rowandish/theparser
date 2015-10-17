class UserMailer < ApplicationMailer
  def weekly_summary(user)
    @user = user
    mail(to: @user.email, subject: 'Riassunto settimanale film')
  end
end
