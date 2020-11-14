FactoryBot.define do
  factory :item do
    name        {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    price       {500}
    category_id  {2}
    condition_id {2}
    postage_id {2}
    prefecture_id {2}
    handing_time_id {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end