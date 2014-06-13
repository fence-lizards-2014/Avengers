class User < ActiveRecord::Base
  has_many :surveys
  has_many :responses
  has_many :choices, through: :responses

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
