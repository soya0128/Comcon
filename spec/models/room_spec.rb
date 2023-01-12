require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "room_nameの値が存在すれば作成できる" do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "room_nameが空では作成できない" do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("チャットルーム名を入力してください")
      end
    end
  end
end
