class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  with_options presence: true do
  validates :image
  validates :item_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :derivery_day


with_options numericality: { other_than: 1, message: 'を入力してください' } do
  validates :category_id 
  validates :condition_id
  validates :payment_id
  validates :prefecture_id
  validates :derivery_day_id
end

end
