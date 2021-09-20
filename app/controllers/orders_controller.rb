class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user == current_user || @item.order.present?
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
    params.require(:credit).permit(:postal_code, :area_id, :city, :add_number, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end