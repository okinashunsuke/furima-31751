FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    purchase_id { 1 }
    item_id { 1 }
    user_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end