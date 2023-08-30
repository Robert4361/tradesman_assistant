class AdminMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Tradesman Assistant account activation')
  end
end
