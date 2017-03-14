class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  # sending a notification mail for the otp
  def forgot_password(user)
    @user = user
    mail(to: @user.email, subject: 'Forgot Password')
  end
end
