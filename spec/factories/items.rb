FactoryBot.define do
  factory :item do
    name               {Faker::Commerce.product_name}
    explanation        {Faker::Lorem.paragraph}
    price              {Faker::Number.within(range: 300..9999999)}
    category_id        {Faker::Number.within(range: 1..10)}
    condition_id       {Faker::Number.within(range: 1..6)}
    delivery_charge_id {Faker::Number.within(range: 1..2)}
    prefecture_id      {Faker::Number.within(range: 1..47)}
    shipping_day_id    {Faker::Number.within(range: 1..3)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
