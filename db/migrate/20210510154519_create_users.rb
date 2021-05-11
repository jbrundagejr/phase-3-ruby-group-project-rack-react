class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    # name (str), email(str)
    create_table :users do |t|
      t.string :name
      t.string :email
    end
  end
end
