FactoryBot.define do
  factory :member do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from:2, to:48) }
    address       { '名古屋市中区' }
    building_name { 'テックビル777' }
    phone_number  { '09012345678' }
    part_id       { Faker::Number.between(from:2, to:5) }
    association :user
  end
end
