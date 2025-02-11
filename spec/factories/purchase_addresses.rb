FactoryBot.define do
  factory :purchase_address do
    post_code      {'123-4567'}
    cities         {'東京都'}
    build          {'ビル'}
    housenumber    {'1-1'}
    tel            {'09011111111'}
    prefecture_id   {'2'}
  end
end
