class ItemsController < ApplicationController
  def index
  end

  private
  def items_params
    params.require(:item).permit(:title, :item_description, :category_id, :status_id,
      :load_id, :area_id, :delivery_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
