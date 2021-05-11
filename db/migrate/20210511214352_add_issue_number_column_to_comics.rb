class AddIssueNumberColumnToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :issue_number, :string
  end
end
