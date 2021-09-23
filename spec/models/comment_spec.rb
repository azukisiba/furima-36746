require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@comment).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'textが空の場合には保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていなければの場合には保存できない' do
        @comment.user_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐づいていなければの場合には保存できない' do
        @comment.item_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
