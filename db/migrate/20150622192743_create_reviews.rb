class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :body
      t.string :brew
      t.string :cafe_id
      t.integer :user_id
      t.integer :roast_id

      t.timestamps null: false
    end
  end
end
