class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:title, :item_description, :category_id, :status_id,
      :load_id, :area_id, :delivery_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
