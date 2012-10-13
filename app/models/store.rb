class Store < ActiveRecord::Base
  attr_accessible :address, :contact_info, :currency, :description, :name, :short_description, :logo

  belongs_to :owner, class_name: User

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description

  mount_uploader :logo, LogoUploader
end
