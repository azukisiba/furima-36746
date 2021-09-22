class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    redirect_to root_path if @item.user == current_user || @item.order.present?
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(order_params)
    if @credit.valid?
      pay_item
      @credit.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:credit).permit(:postal_code, :area_id, :city, :add_number, :building, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
