class Clinic < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
