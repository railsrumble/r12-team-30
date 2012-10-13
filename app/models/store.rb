class Store < ActiveRecord::Base
  attr_accessible :address, :contact_info, :currency, :description, :name,
    :short_description, :logo, :pictures_attributes, :opening_times_attributes

  belongs_to :owner, class_name: User
  has_many :pictures, class_name: StorePicture
  has_many :opening_times

  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :opening_times, allow_destroy: true

  validates_presence_of :name, :address, :description

  mount_uploader :logo, LogoUploader
end
