class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(check_password)
    self.password == check_password
  end
end
