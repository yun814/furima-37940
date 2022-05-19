class Item < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: {other_than: 1}
  validates :condition_id, numericality: {other_than: 1}
  validates :delivery_charge_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :shipping_day_id, presence: true
  validates :price, presence: true

  has_one_attached :image
  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
end
