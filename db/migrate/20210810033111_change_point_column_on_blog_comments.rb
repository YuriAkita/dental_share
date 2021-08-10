class ChangePointColumnOnBlogComments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :blog_comments, :content, false
  end
end
