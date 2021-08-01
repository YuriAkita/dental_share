class Blog < ApplicationRecord
  validates :content, presence: true
  validates :images, presence: true
  belongs_to :user
  has_many_attached :images
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  has_many :comments, dependent: :destroy
end
