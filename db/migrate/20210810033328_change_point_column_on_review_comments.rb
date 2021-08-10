class ChangePointColumnOnReviewComments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :review_comments, :content, false
  end
end
