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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'Eメールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'Eメールアドレスに@が含まれないと登録できない' do
        @user.email = 'user.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '同じEメールアドレスがすでに登録されていると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが５文字以下だと登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードとパスワード(確認用)が一致しなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '苗字(全角)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '苗字(全角)が全角以外では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it '名前(全角)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '名前(全角)が全角以外では登録できない' do
        @user.last_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it '苗字(全角カナ)が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it '苗字(全角カナ)が全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'ccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は不正な値です")
      end
      it '名前(全角カナ)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it '名前(全角カナ)が全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'ddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
    end
  end

  describe 'ユーザー情報更新' do
    context '情報更新ができる場合' do
      it '全ての値が存在すれば更新できる' do
        expect(@user).to be_valid
      end
    end
    context '情報更新ができない場合' do
      it 'ニックネームが空では更新できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'Eメールアドレスが空では更新できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'Eメールアドレスに@が含まれないと更新できない' do
        @user.email = 'user.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '同じEメールアドレスがすでに登録されていると更新できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it '苗字(全角)が空では更新できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '苗字(全角)が全角以外では更新できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it '名前(全角)が空では更新できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '名前(全角)が全角以外では更新できない' do
        @user.last_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it '苗字(全角カナ)が空では更新できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it '苗字(全角カナ)が全角カタカナ以外では更新できない' do
        @user.first_name_kana = 'ccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は不正な値です")
      end
      it '名前(全角カナ)が空では更新できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it '名前(全角カナ)が全角カタカナ以外では更新できない' do
        @user.last_name_kana = 'ddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
    end
  end
end
