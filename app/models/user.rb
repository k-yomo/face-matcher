class User < ActiveRecord::Base
  has_many :faces
  validates :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(login_info)
    user = User.find_by(email: login_info[:email])
    (user && user.password == login_info[:password]) ? user : nil
  end
end
