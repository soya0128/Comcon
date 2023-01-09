FactoryBot.define do
  factory :storage do
    name  { Faker::Lorem.sentence }
    association :user

    after(:build) do |storage|
      storage.image.attach(io: File.open('public/images/present_box.png'),filename: 'present_box.png')
    end
  end
end
