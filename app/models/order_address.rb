class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :token

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, format: {with: /\A\d+\z/, message: "is invalid. Input only number"}
  validates :telephone_number, format: {with: /\A.{10,11}\z/, message: "is too short"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end