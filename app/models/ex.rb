#we use this to get the image
require 'open-uri'
class Ex < ActiveRecord::Base
  attr_accessible :category, :description, :name, :url, :user_id, :asset, :image_url
  has_attached_file :asset,
  									:url => "/assets/exes/:id/:basename.:extension",
  									:path => ":rails_root/public/assets/exes/:id/:basename.:extension",
  									:default_url => "/assets/noimage.jpg"
  validates :name, :presence => true


  def image_url
  	if self[:image_url]
			return self[:image_url]
		else
			return asset.url
		end
  end

end
