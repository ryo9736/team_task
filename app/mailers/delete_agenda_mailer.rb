class DeleteAgendaMailer < ApplicationMailer
  def delete_agenda_mail(agenda, user)
    @agenda = agenda
    @user = user
    mail to: User.find(@user.user_id).email,
    subject: "アジェンダを削除しました"
  end
end
