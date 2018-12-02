class Token < ActiveRecord::Base
  belongs_to :member

  before_validation :generate_token, on: :create
  # validates_presence_of :member
  scope :available, -> { where("expire_at > ? and is_used = ?", Time.now, false) }

  class << self
    def generate_token
      SecureRandom.hex(16)
    end
  end

  def is_used!
    self.update is_used: true
  end

  def expired?
    expire_at <= Time.now
  end

  def generate_token
    self.token     = SecureRandom.hex 16
    self.expire_at = Time.now + 30.minute
  end
end