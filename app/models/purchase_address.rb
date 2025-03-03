class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :cities, :housenumber, :build, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :cities
    validates :housenumber
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :user_id
    validates :token
    validates :item_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, cities: cities, housenumber: housenumber, build: build,
                   tel: tel, purchase_id: purchase.id)
  end
end
