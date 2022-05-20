FactoryBot.define do
  factory :item do
    name               {Faker::Commerce.product_name}
    explanation        {Faker::Lorem.paragraph}
    price              {Faker::Number.within(range: 300..9999999)}
    category           {Category.all.sample}
    condition          {Condition.all.sample}
    delivery_charge    {DeliveryCharge.all.sample}
    prefecture         {Prefecture.all.sample}
    shipping_day       {ShippingDay.all.sample}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
