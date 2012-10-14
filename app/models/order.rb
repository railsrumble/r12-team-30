class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :customer, class_name: User
  has_many :items, class_name: OrderItem
  attr_accessible :customer_note, :pickup_time, :status, :store_note, :store_id

  delegate :owner, :currency, to: :store

  after_create :set_order_status

  validate :pickup_time_not_past, on: :create

  default_scope order("pickup_time")
  scope :manageable, where("orders.status = 'New' OR orders.status = 'Confirmed'")

  def total
    items.inject(0) do |result, item|
      result + item.subtotal
    end
  end

  def self.status_new
    "New"
  end

  def self.status_confirmed
    "Confirmed"
  end

  def self.status_completed
    "Completed"
  end

  def self.available_statuses
    [
      Order.status_new,
      Order.status_confirmed,
      Order.status_completed
    ]
  end


  def confirm!
    self.update_attribute(:status, Order.status_confirmed)
  end

  def complete!
    self.update_attribute(:status, Order.status_completed)
  end

  def is_confirmable?
    self.status == Order.status_new
  end

  def is_completeable?
    self.status == Order.status_confirmed
  end

  private

  def set_order_status
    self.update_attributes(:status => Order.status_new)
  end

  def pickup_time_not_past
    if pickup_time and pickup_time < Time.now
      errors.add :pickup_time, "must be in the future"
    end
  end
end
