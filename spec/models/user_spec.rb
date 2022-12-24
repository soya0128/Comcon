require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'すべての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'Eメールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'Eメールアドレスに@が含まれないと登録できない' do
        @user.email = 'user.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '同じEメールアドレスがすでに登録されていると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが５文字以下だと登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードとパスワード(確認用)が一致しなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '苗字(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字(全角)が全角以外では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '名前(全角)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前(全角)が全角以外では登録できない' do
        @user.last_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '苗字(全角カナ)が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字(全角カナ)が全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'ccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '名前(全角カナ)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前(全角カナ)が全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'ddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
    end
  end
end
