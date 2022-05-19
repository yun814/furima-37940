class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true

  has_one_attached :image
  belongs_to :user
end
