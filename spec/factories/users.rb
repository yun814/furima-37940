FactoryBot.define do
  factory :user do
    nickname              {Gimei.name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name_kanji       {nickname.last}
    first_name_kanji      {nickname.first}
    last_name_kana        {last_name_kanji.katakana}
    first_name_kana       {first_name_kanji.katakana}
    birth_date            {Faker::Date.birthday}
  end
end
