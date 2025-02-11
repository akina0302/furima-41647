class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:cities,:housenumber,:build ,:tel, :user_id, :item_id

  validates :post_code, presence: true ,format:{with:/\A[0-9]{3}-[0-9]{4}\z/}
  validates :cities, presence: true
  validates :housenumber, presence: true
  validates :tel, presence: true,format:{with:/\A[0-9]{10,11}\z/}
  validates :prefecture_id, presence: true , numericality: { other_than: 1 , message: "を入力してください"}
  validates :user_id, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code,prefecture_id: prefecture_id,cities: cities,housenumber: housenumber,build: build,tel: tel,purchase_id: purchase.id)
  end
end

