class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @credit = Credit.new
  end

  def create
    @item = Item.find(params[:item_id])
    @credit = Credit.new(order_params)
    if @credit.valid?
      @credit.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:credit).permit(:postal_code, :area_id, :city, :number, :building, :phone_num, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
