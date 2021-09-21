require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @credit = FactoryBot.build(:credit, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@credit).to be_valid
      end
      it '市町村以外正しく入力されていれば保存できること' do
        @credit.building = ''
        expect(@credit).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @credit.postal_code = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @credit.postal_code = '1231234'
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が空だと保存できない' do
        @credit.area_id = 1
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Area can't be blank")
      end
      it '市町村が空だと保存できない' do
        @credit.city = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @credit.add_number = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Add number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @credit.phone_num = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号が10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @credit.phone_num = '090-1111-2222'
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Phone num is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @credit.token = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
