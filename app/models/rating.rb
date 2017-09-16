class Rating < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :comment, polymorphic: true
  belongs_to :post, polymorphic: true
end
