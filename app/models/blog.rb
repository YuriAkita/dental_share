class Blog < ApplicationRecord
  validates :content, presence: true
  validates :images, presence: true
  belongs_to :user
  has_many_attached :images
end
