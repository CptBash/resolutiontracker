class UserMailer < ApplicationMailer
  def resolution_reminder(resolution)
    @user = resolution.user
    @resolution = resolution
    mail(to: @user.email, subject: 'Time for a Reminder!')
  end
end
