class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :ratings, as: :rateable

  validates :user, :post, :comment_body, presence: true
end
