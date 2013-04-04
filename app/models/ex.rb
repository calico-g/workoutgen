class Ex < ActiveRecord::Base
  attr_accessible :category, :description, :name, :url, :user_id, :asset
  has_attached_file :asset,
  									:url => "/assets/exes/:id/:basename.:extension",
  									:path => ":rails_root/public/assets/exes/:id/:basename.:extension"
end
