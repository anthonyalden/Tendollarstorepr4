class BuyersController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @buyer = Buyer.new (buyer_params)
      @order = current_order
      @order.order_status_id = 2
      @order.buyer_id = @buyer._id
      # session[:order_id] = nil
      if @order.save
         if @buyer.save
            redirect_to new_order_charge_path(current_order)      
          else
            redirect_to items_path
          end 
      else
        redirect_to items_path
      end
      # if @buyer.save
      #    redirect_to request.referer      
      # else
      #    redirect_to items_path
      # end
  end

  def edit

  end

  def update

  end

  def delete

  end

private

  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :addr1, :addr2, :city, :state, :zip, :phone, :email)
  end
end
