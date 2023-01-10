require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'message_contentとimageが存在していれば保存できる' do
        expect(@message).to be_valid
      end
      it 'message_contentが空でも保存できる' do
        @message.message_content = ''
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'message_contentとimageが空では保存できない' do
        @message.message_content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("メッセージを入力してください")
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("チャットルームを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end
