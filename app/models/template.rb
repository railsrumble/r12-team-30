class Template < ActiveRecord::Base
  attr_accessible :layout, :name, :template

  has_many :themes
end
