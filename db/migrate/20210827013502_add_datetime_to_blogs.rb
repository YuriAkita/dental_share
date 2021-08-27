class AddDatetimeToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :start_time, :datetime, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end
end
