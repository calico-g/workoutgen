class AddAttachmentAssetToExes < ActiveRecord::Migration
  def self.up
    change_table :exes do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :exes, :asset
  end
end
