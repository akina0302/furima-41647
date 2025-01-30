class Item < ApplicationRecord
  belongs_to :user
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true,numericality: { greater_thn_or_equal_to:300, less_than_or_equal_to: 9999999}, format: { with:/\A[0-9]+\z/ }
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :derivery_day

  validates :category_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :condition_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :payment_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :derivery_day_id, numericality: { other_than: 1 , message: "を入力してください"}

end
