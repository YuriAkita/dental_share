class AddClinicRefToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :clinic, null: false, foreign_key: true
  end
end
