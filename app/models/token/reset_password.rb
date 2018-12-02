class Token::ResetPassword < ::Token
  # after_commit :send_token

  private

  # def send_token
  #   TokenMailer.reset_password
  # end
end