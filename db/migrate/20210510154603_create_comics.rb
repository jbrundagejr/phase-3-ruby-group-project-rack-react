class CreateComics < ActiveRecord::Migration[5.2]
  def change
    # name(str), author(str), date published(str), summary(str)
    create_table :comics do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :summary
    end
  end
end
