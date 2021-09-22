FactoryBot.define do
  factory :credit do
    postal_code { '123-4567' }
    area_id { 3 }
    city { '東京都' }
    add_number { '1-1' }
    building { '東京ハイツ' }
    phone_num { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
