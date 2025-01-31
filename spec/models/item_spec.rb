require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do

      it '全ての情報が存在した場合商品が出品できる'do
      expect(@item).to be_valid
      end

    end

    context '商品が出品できない場合' do
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it'商品名がないと登録できない'do
       @item.item_name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明がないと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '販売価格がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'カテゴリーを入力しないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態を入力しないと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担を入力しないと登録できない' do
        @item.payment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域を入力しないと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '配送までの日数を入力しないと登録できない' do
        @item.derivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '商品名が40文字より多いと登録できない' do 
        @item.item_name = '商品名'*140
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it '商品の説明が1000文字より多いと登録できない' do
        @item.description = '説明'*1000
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end
      it '価格が300円未満だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it '価格が9999999円より高いと登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it '価格が数値以外で入力されると登録できない' do
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
