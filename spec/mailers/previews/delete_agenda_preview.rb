# Preview all emails at http://localhost:3000/rails/mailers/delete_agenda
class DeleteAgendaPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/delete_agenda/mailer
  def mailer
    DeleteAgendaMailer.mailer
  end

end
