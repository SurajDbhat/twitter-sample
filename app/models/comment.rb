class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one_attached :content

  acts_as_votable
end
