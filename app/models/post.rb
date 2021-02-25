class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :content

  acts_as_votable

  enum status: {
    draft: 'draft',
    published: 'published'
  }

  after_create :update_status

  private

  def update_status
    draft!
  end
end
