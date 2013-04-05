class AddImageUrlToExes < ActiveRecord::Migration
  def change
    add_column :exes, :image_url, :string
  end
end
