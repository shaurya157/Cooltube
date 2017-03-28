class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, uniqueness: true

  after_initialize :ensure_session_token, :ensure_profile_picture
  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_profile_picture
    # TODO find profile picture default
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
end
