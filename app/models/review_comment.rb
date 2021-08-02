class ReviewComment < ApplicationRecord
  validates :content, presence: true
end
