FactoryBot.define do
  factory :item do
    item_name { Faker::Games::Pokemon.name }
    price { Faker::Number.within(range: 300..9_999_999) }
    item_category_id { Faker::Number.within(range: 2..11) }
    item_status_id { Faker::Number.within(range: 2..7) }
    fee_resp_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_term_id { Faker::Number.within(range: 2..4) }
    content { Faker::Games::Pokemon.move }
  end
end
