class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.references :order,                null: false, foreign_key: true
      t.string     :delivery_postalcode,  null: false
      t.integer    :prefecture_id,        null: false
      t.string     :delivery_city,        null: false
      t.string     :delivery_block,       null: false
      t.string     :delivery_building
      t.string     :orderer_phone_num,    null: false

      t.timestamps
    end
  end
end
