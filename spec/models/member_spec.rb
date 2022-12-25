require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @member = FactoryBot.build(:member)
  end

  describe '団員情報登録' do
    context '情報の登録ができる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@member).to be_valid
      end
      it '建物名が存在しなくても登録できる' do
        @member.building_name = ''
        expect(@member).to be_valid
      end
    end
    context '情報の登録ができない場合' do
      it '郵便番号が空だと登録できない' do
        @member.postal_code = ''
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが含まれないと登録できない' do
        @member.postal_code = '1234567'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が全角だと登録できない' do
        @member.postal_code = '１２３ー４５６７'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が３桁＋ハイフン＋４桁以外の形式では登録できない' do
        @member.postal_code = '1234-567'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が選択されていないと登録できない' do
        @member.prefecture_id = 1
        @member.valid?
        expect(@member.errors.full_messages).to include("都道府県を選択してください")
      end
      it '住所が空だと登録できない' do
        @member.address = ''
        @member.valid?
        expect(@member.errors.full_messages).to include("住所を入力してください")
      end
      it '電話番号が全角だと登録できない' do
        @member.phone_number = '０９０１２３４５６７８'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号にハイフンが含まれていると登録できない' do
        @member.phone_number = '090-1234-5678'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が９桁以下だと登録できない' do
        @member.phone_number = '090123456'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が１２桁以上だと登録できない' do
        @member.phone_number = '090123456789'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'パートが選択されていないと登録できない' do
        @member.part_id = 1
        @member.valid?
        expect(@member.errors.full_messages).to include("パートを選択してください")
      end
    end
  end

  describe '団員情報編集' do
    context '情報の更新ができる場合' do
      it '全ての値が存在すれば更新できる' do
        expect(@member).to be_valid
      end
      it '建物名が存在しなくても更新できる' do
        @member.building_name = ''
        expect(@member).to be_valid
      end
    end
    context '情報の更新ができない場合' do
      it '郵便番号が空だと更新できない' do
        @member.postal_code = ''
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンが含まれないと更新できない' do
        @member.postal_code = '1234567'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が全角だと更新できない' do
        @member.postal_code = '１２３ー４５６７'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が３桁＋ハイフン＋４桁以外の形式では更新できない' do
        @member.postal_code = '1234-567'
        @member.valid?
        expect(@member.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が選択されていないと更新できない' do
        @member.prefecture_id = 1
        @member.valid?
        expect(@member.errors.full_messages).to include("都道府県を選択してください")
      end
      it '住所が空だと更新できない' do
        @member.address = ''
        @member.valid?
        expect(@member.errors.full_messages).to include("住所を入力してください")
      end
      it '電話番号が全角だと更新できない' do
        @member.phone_number = '０９０１２３４５６７８'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号にハイフンが含まれていると更新できない' do
        @member.phone_number = '090-1234-5678'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が９桁以下だと更新できない' do
        @member.phone_number = '090123456'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が１２桁以上だと更新できない' do
        @member.phone_number = '090123456789'
        @member.valid?
        expect(@member.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'パートが選択されていないと更新できない' do
        @member.part_id = 1
        @member.valid?
        expect(@member.errors.full_messages).to include("パートを選択してください")
      end
    end
  end
end
