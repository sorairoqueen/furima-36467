class OrderDeliveryaddress
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :delivery_postalcode, :prefecture_id, :delivery_city, :delivery_block, :delivery_building, :orderer_phone_num

  with_options presence: true do
    validates :delivery_postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
              numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_city, :delivery_block
    validates :orderer_phone_num, format: { with: /[0-9]{10,11}/ }
  end

end
