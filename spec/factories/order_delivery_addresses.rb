FactoryBot.define do
  factory :order_delivery_address do
    order_id { 1 }
    delivery_postalcode { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_city { '東京都' }
    delivery_block { '1-1' }
    delivery_building { '東京ハイツ' }
    orderer_phone_num { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
