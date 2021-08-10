class ChangePointColumnOnBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column_null :blogs, :content, false
  end
end
