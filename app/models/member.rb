class Member < ActiveRecord::Base
  scope :enabled, -> { where(disabled: false) }

  class << self
    def current
      Thread.current[:user]
    end

    def current=(user)
      Thread.current[:user] = user
    end

    #find or create member
    def from_auth(auth_hash)
      locate_email(auth_hash) || create_from_auth(auth_hash)
    end

    def locate_email(auth_hash)
      return nil if auth_hash['info']['email'].blank?
      member = find_by_email(auth_hash['info']['email'])
      return nil unless member
      member
    end

    def create_from_auth(auth_hash)
      member = create(email: auth_hash['info']['email'], nick_name: auth_hash['info']['nick_name'], activated: false)
      member.send_activation
      member
    end

  end

  def activated!
    self.update activated: true
  end

  # after_create, send activate token
  def send_activation
    Token::Activation.create member_id: id
  end
end

