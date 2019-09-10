class TransferAuthorityMailer < ApplicationMailer
  def transfer_authority_mailer(team, user_id)
    @team = team
    @user_id = user_id

    mail to: User.find(@user_id).email, subject: "チームリーダーになりました"
  end
end