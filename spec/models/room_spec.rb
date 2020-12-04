require 'rails_helper'
describe Room do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成機能' do
    context 'ルーム作成がうまく行くとき' do
      it 'name、capacity_id、year_id、month_id、prefecture_id、が存在すれば登録できること' do
        expect(@room).to be_valid
      end
    end

    context 'ルーム作成がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("ルーム名を入力してください")
      end

      it 'capacity_idが0だと登録できない' do
        @room.capacity_id = 0
        @room.valid?
        expect(@room.errors.full_messages).to include('定員を選択してください')
      end

      it 'year_idが0だと登録できない' do
        @room.year_id = 0
        @room.valid?
        expect(@room.errors.full_messages).to include('期間(年)を選択してください')
      end

      it 'month_idが0だと登録できない' do
        @room.month_id = 0
        @room.valid?
        expect(@room.errors.full_messages).to include('期間(月)を選択してください')
      end

      it 'prefecture_idが0だと登録できない' do
        @room.prefecture_id = 0
        @room.valid?
        expect(@room.errors.full_messages).to include('都道府県を選択してください')
      end
    end
  end
end
