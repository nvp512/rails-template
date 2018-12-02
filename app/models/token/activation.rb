class Token::Activation < ::Token
  after_create :send_token

  private

  def send_token
    TokenMailer.activate_account(member.email, token).deliver
  end
end
