# Preview all emails at http://localhost:3000/rails/mailers/transfer_authority
class TransferAuthorityPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transfer_authority/mailer
  def mailer
    TransferAuthorityMailer.mailer
  end

end
