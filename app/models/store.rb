class Store < ActiveRecord::Base
  attr_accessible :address, :contact_info, :currency, :description, :name, :short_description
end
