require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address,user_id: user.id)
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do

      it '全ての値が正しく入力されていれば保存できる'do
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
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号は3桁-4桁の半角文字列のみ保存可能'do
      @purchase_address.post_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が必須'do
      @purchase_address.prefecture_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('都道府県を入力してください')
      end
      it '市区町村が必須'do
      @purchase_address.cities = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it'番地が必須' do
      @purchase_address.housenumber = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が必須' do
      @purchase_address.tel = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は10桁以上11桁以内の半角数値のみ保存可能' do
      @purchase_address.tel = '111-111-1111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
