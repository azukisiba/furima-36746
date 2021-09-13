FactoryBot.define do
  factory :user do

    nickname {"太郎"}
    email {Faker::Internet.free_email}
    password {"aaa000"}
    password_confirmation {password}
    kanji_name_first {"太郎"}
    kanji_name_last {"田中"}
    kana_name_first {"タロウ"}
    kana_name_last {"タナカ"}
    birth_date {1995-06-06}
  end
end
