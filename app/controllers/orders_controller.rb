class OrdersController < ApplicationController

  def index
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(order_params)
  end

  def order_params
    params.require(:credit).permit(:postal_code, :area_id, :city, :number, :building, :phone_num, :order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
