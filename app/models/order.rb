class Order < ActiveRecord::Base
  belongs_to :store
  attr_accessible :customer_note, :pickup_time, :status, :store_note
end
