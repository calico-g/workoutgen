class Ex < ActiveRecord::Base
  attr_accessible :category, :description, :name, :url, :user_id, :asset
  has_attached_file :asset
end
