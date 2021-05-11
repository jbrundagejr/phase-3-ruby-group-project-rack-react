class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :group_id
      t.string :title
      t.string :content
    end
  end
end
