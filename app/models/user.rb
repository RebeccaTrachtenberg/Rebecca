class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true
  has_secure_password

  has_many :posts, foreign_key: "poster_id"
  has_many :comments
  has_many :commented, :through => :comments, :source => :posts
end
