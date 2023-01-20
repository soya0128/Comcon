require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = FactoryBot.build(:payment)
  end

  context '内容に問題がない場合' do
    it 'price,token,userが存在すれば保存できる' do
      expect(@payment).to be_valid
    end
  end
  context '内容に問題がある場合' do
    it 'priceが空では保存できない' do
      @payment.price = ''
      @payment.valid?
      expect(@payment.errors.full_messages).to include("金額を入力してください")
    end
    it 'userが紐づいていなければ保存できない' do
      @payment.user = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Userを入力してください")
    end
    it 'tokenが空では保存できない' do
      @payment.token = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
