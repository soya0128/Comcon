require "rails_helper"

RSpec.describe EmailMailer, type: :mailer do
  before do
    @email = FactoryBot.build(:email)
  end

  describe 'メール新規作成' do
    context 'メールがDBに保存される場合' do
      it '件名、本文があれば保存できる' do
        expect(@email).to be_valid
      end
    end
    context 'メールがDBに保存されない場合' do
      it '件名が空だと保存できない' do
        @email.subject = ''
        @email.valid?
        expect(@email.errors.full_messages).to include("件名を入力してください")
      end
      it '本文が空だと保存できない' do
        @email.content = ''
        @email.valid?
        expect(@email.errors.full_messages).to include("本文を入力してください")
      end
    end
  end
end
