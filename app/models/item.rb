class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}
  validates :price, numericality: {only_integer: true, message: 'is invalid. Input half-width characters'}
  validates :category_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :condition_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :delivery_charge_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :shipping_day_id, numericality: {other_than: 0, message: "can't be blank"}

  has_one_attached :image
  has_one :order
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day
end
