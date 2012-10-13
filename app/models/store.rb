class Store < ActiveRecord::Base
  attr_accessible :address, :contact_info, :currency, :description, :name,
    :short_description, :logo, :pictures_attributes

  belongs_to :owner, class_name: User
  has_many :pictures, class_name: StorePicture
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description

  mount_uploader :logo, LogoUploader
end
