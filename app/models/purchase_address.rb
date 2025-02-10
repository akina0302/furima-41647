class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :addresses,:post_code,:prefecture_id,:cities,:housenumber,:build ,:tel,:purchases, :user_id, :item_id

  validates :post_code, presence: true
  validates :cities, presence: true
  validates :housenumber, presence: true
  validates :tel, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code,prefecture_id: prefecture_id,cities: cities,housenumber: housenumber,build: build,tel: tel,purchases: purchase.id)
  end
end

