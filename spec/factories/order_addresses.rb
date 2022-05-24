FactoryBot.define do
  Faker::Config.locale = 'ja'
  factory :order_address do
    token            {'tok_' + Faker::Lorem.characters(number: 28)}
    postal_code      {Faker::Address.zip}
    prefecture_id    {Faker::Number.within(range: 1..47)}
    municipality     {Faker::Address.city}
    address          {Faker::Address.street_address}
    telephone_number {Faker::Number.number(digits: 11)}
    building         {Faker::Lorem.word}
  end
end
