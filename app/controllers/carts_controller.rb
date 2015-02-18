class CartsController < ApplicationController
  def show
    if current_order != nil
      @order_items = current_order.order_items
    end
    
  end
end
