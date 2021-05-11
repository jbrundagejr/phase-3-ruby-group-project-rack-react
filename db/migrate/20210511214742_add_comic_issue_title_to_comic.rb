class AddComicIssueTitleToComic < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :issue_title, :string
  end
end
