class TokenMailer < ApplicationMailer

  def activate_account email, token
    @token_url = edit_activation_url token
    sent_mail email
  end

  # def reset_password email, token
  #   sent_mail email, token
  # end

  private
  def sent_mail email
    mail(to: email)
  end
end