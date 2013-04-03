class CreateExes < ActiveRecord::Migration
  def change
    create_table :exes do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
