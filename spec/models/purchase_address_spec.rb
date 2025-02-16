require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address,user_id: user.id,item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildは空でも保存できる' do
        @purchase_address.build = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報が保存できない場合' do
      it '郵便番号が必須' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号は3桁-4桁の半角文字列のみ保存可能' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '都道府県が必須' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を入力してください')
      end
      it '市区町村が必須' do
        @purchase_address.cities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it '番地が必須' do
        @purchase_address.housenumber = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('番地を入力してください')
      end
      it '電話番号が必須' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_address.tel = '11111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_address.tel = '123456789112'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_address.tel = '090-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tokenを入力してください')
      end
      it 'userが紐づいていないと登録できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Userを入力してください')
      end
      it 'itemが紐づいていないと登録できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end
