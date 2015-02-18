class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_order

  # def current_order
  #   if !session[:order_id].nil?
  #     @order = Order.find(session[:order_id])
  #     if @order.order_status_id === 1
  #       return @order
  #     else
  #       return nil
  #     end
  #   else
  #     @order = Order.new
  #     @order.order_status_id = 1
  #     @order.save
  #     return @order
  #   end
  # end

  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
end
