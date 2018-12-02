class MemberMailer  < ApplicationMailer

  def login_notification member_id
    sent_mail member_id
  end

  def

  end

  private

  def sent_mail member_id
    @member = Member.find member_id
    mail(to: @member.email)
  end
end