class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :delivery_postalcode, :prefecture_id, :delivery_city, :delivery_block,
                :delivery_building, :orderer_phone_num, :token

  with_options presence: true do
    validates :delivery_postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,
              numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_city, :delivery_block
    validates :orderer_phone_num, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id, :item_id, :token
  end
  def save
    order = Order.create(
      user_id: user_id, item_id: item_id
    )
    DeliveryAddress.create(
      order_id: order.id, delivery_postalcode: delivery_postalcode, prefecture_id: prefecture_id, delivery_city: delivery_city, delivery_block: delivery_block, delivery_building: delivery_building, orderer_phone_num: orderer_phone_num
    )
  end
end
