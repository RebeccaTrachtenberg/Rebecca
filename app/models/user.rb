class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true
  has_secure_password

  add associations!!!!!!!!!!!!!!!
end
