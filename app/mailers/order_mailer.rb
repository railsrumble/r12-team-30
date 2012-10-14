class OrderMailer < ActionMailer::Base
  default from: "service@foodstrap.me"

  def order_received(order)
    @owner = order.owner
    @order = order
    mail(:to => @owner.email, :subject => "You have a new order on FoodStrap.me")
  end

  def order_confirmed(recipient)
    @customer = recipient
    mail(:to => recipient.email)
  end
end
