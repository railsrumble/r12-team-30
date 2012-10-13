class Theme < ActiveRecord::Base
  attr_accessible :font, :layout, :palette, :template

  belongs_to :store
  belongs_to :template
end
