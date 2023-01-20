FactoryBot.define do
  factory :payment do
    price {12000}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
  end
end
