class Address < ApplicationRecord
  belongs_to :purchase
  # validates :post_code, presence: true
  # validates :cities, presence: true
  # validates :housenumber, presence: true
  # validates :tel, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}

end
