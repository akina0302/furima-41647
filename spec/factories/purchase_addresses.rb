FactoryBot.define do
  factory :purchase_address do
    user_id        { Faker::Number.non_zero_digit }
    item_id        { Faker::Number.non_zero_digit }
    post_code      { '123-4567' }
    cities         { '東京都' }
    build          { 'ビル' }
    housenumber    { '1-1' }
    tel            { '09011111111' }
    prefecture_id   { '2' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
