FactoryBot.define do
  factory :email do
    subject { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    association :user
  end
end
