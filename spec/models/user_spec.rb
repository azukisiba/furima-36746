require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmationと漢字名とカナ名と生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@無しでは登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '漢字名(苗字)が空では登録できない' do
        @user.kanji_name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji name last can't be blank")
      end
      it '漢字名(名前)が空では登録できない' do
        @user.kanji_name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji name first can't be blank")
      end
      it 'カナ名(苗字)が空では登録できない' do
        @user.kana_name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name last can't be blank")
      end
      it 'カナ名(名前)が空では登録できない' do
        @user.kana_name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name first can't be blank")
      end
      it '漢字名(苗字)が半角では登録できない' do
        @user.kanji_name_last = 'tata'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji name last is invalid')
      end
      it '漢字名(名前)が半角では登録できない' do
        @user.kanji_name_first = 'tata'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji name first is invalid')
      end
      it 'カナ名(苗字)が半角では登録できない' do
        @user.kana_name_last = 'tata'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana name last is invalid')
      end
      it 'カナ名(名前)が半角では登録できない' do
        @user.kana_name_first = 'tata'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana name first is invalid')
      end
      it 'カナ名(名前)が半角では登録できない' do
        @user.kana_name_first = 'tata'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana name first is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみではでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみではでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは全角で登録できない' do
        @user.password = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'birth_dateが空では保存できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
