class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.text :content, nill: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
