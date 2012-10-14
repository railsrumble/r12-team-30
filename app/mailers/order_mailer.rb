class OrderMailer < ActionMailer::Base
  default from: "service@foodstrap.me"

  def order_received(recipient)
    @owner = recipient
    mail(:to => recipient.email)
  end

  def order_confirmed(recipient)
    @customer = recipient
    mail(:to => recipient.email)
  end
end
