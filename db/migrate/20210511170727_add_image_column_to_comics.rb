class AddImageColumnToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :image_url, :string
  end
end
