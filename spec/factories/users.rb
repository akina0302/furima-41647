FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    first_name              { 'やマ田' }
    last_name               { 'はナ子' }
    first_name_furigana     { 'ヤマダ' }
    last_name_furigana      { 'ハナコ' }
    birth_date              { Faker::Date.birthday }
  end
end
