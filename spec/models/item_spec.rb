require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する商品の保存' do
    context '商品が保存できる場合' do
      it '画像、商品名、説明、カテゴリ、状態、発送負担、地域、発送日、値段があれば商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it '画像が空だと保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと保存ができない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '説明が空だと保存ができない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリが---だと保存ができない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '状態が---だと保存ができない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送負担が---だと保存ができない' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end
      it '地域が---だと保存ができない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送日が---だと保存ができない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '値段が空白だと保存ができない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '値段が全角だと保存ができない' do
        @item.selling_price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '値段が300以下だと保存ができない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '値段が9999999より大きいと保存ができない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
    end
  end
end
