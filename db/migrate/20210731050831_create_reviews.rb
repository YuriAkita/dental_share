class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.datetime :reservation_at, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.integer :quote_price, default: "", null: false
      t.integer :orthodontics_type, default: 0, null: false
      t.text :content, null: false
      t.integer :star, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
