class Post < ActiveRecord::Base
  validates :poster, :title, :body, presence: true

  has_many :comments
  has_many :ratings, as: :rateable
  belongs_to :poster, class_name: 'User'
  has_many :commenters, :through => :comments, :source => :user
end
