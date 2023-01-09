require 'rails_helper'

RSpec.describe Storage, type: :model do
  before do
    @storage = FactoryBot.build(:storage)
  end

  describe 'ファイル投稿' do
    context 'ファイル投稿ができる場合' do
      it 'ファイル名、ファイルがあれば投稿できる' do
        expect(@storage).to be_valid
      end
    end
    context 'ファイル投稿ができない場合' do
      it 'ファイル名が空だと投稿できない' do
        @storage.name = ''
        @storage.valid?
        expect(@storage.errors.full_messages).to include("ファイル名を入力してください")
      end
      it 'ファイルがないと投稿できない' do
        @storage.image = nil
        @storage.valid?
        expect(@storage.errors.full_messages).to include("ファイルを入力してください")
      end
    end
  end
end
