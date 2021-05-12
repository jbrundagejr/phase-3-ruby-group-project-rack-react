class DeleteComicIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :comic_id
  end
end
