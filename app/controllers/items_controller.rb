class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless @item.user == current_user
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :item_description, :category_id, :status_id,
                                 :load_id, :area_id, :delivery_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
