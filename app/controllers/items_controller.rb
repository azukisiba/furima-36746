class ItemsController < ApplicationController
  def index
  end

  private
  def items_params
    params.require(:item).permit(:title, :image).merge(user_id: current_user.id)
  end
end
