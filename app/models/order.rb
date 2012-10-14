class Order < ActiveRecord::Base
  belongs_to :store
  has_many :items, class_name: OrderItem
  attr_accessible :customer_note, :pickup_time, :status, :store_note, :store_id
end
