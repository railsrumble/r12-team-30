class NotificationObserver < ActiveRecord::Observer
  observe Order

  def after_create(order)
    OrderMailer.order_received(order.owner).deliver
  end

  def after_update(order)
    case order.status
    when Order.status_confirmed
      OrderMailer.order_confirmed(order.customer).deliver
    end
  end
end
