class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :comic_id
      t.integer :user_id
      t.string :content
      t.integer :rating
    end
  end
end
