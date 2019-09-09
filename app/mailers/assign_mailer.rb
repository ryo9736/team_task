class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mailer(email, password)
    @email = email
    @password = password
    mail to: @email, subject: '登録完了'
  end
end
