FactoryBot.define do
  factory :item do
    title {'test'}
    item_description {'test'}
    category_id {2}
    status_id {2}
    load_id {2}
    area_id {2}
    delivery_id {2}
    selling_price {'20000'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user 
  end
end