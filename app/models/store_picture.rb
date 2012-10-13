class StorePicture < ActiveRecord::Base
  attr_accessible :image
  belongs_to :store
  mount_uploader :image, ImageUploader
end
