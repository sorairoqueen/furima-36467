FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email  {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    last_name  {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {'test_kana'}
    first_name_kana  {'example_kana'}
    birthday {Faker::Date.between(from: '1961-04-02', to: '2012-04-01')}
  end
end