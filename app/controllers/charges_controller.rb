class ChargesController < ApplicationController
def new
  @order = Order.find(params[:order_id])
  
  total_amount=0
  @order.order_items.each do |order_item|
    total_amount = total_amount + ((order_item.unit_price * order_item.quantity) + order_item.shipping_cost)
    order_item.destroy
  end
  @order.total= (total_amount *100).floor
  @order.save
end

def create
  # Amount in cents
  
  @order = Order.find(params[:order_id])
    
  @amount = @order.total

  customer = Stripe::Customer.create(
    :email => 'talden@earthlink.net',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Ten Dollar Store Customer',
    :currency    => 'usd'
  )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
