class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}
  validates :price, numericality: {only_integer: true, message: 'is invalid. Input half-width characters'}
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day
end
