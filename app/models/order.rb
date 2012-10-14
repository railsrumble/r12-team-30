class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :customer, class_name: User
  has_many :items, class_name: OrderItem
  attr_accessible :customer_note, :pickup_time, :status, :store_note, :store_id

  delegate :currency, to: :store

  after_create :set_order_status

  def total
    items.inject(0) do |result, item|
      result + item.subtotal
    end
  end

  def self.available_statuses
    %w(
      New
      Confirmed
      Completed
    )
  end

  private

  def set_order_status
    self.update_attributes(:status => Order.available_statuses.first)
  end
end
