FactoryBot.define do
  factory :message do
    message_content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/present_box.png'), filename: 'present_box.png')
    end
  end
end
