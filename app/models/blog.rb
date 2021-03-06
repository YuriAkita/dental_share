class Blog < ApplicationRecord
  validates :content, presence: true
  validates :images, presence: true
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  has_many :blog_comments, dependent: :destroy

  def bookmark_user(user_id)
    bookmarks.find_by(user_id: user_id)
  end
end
