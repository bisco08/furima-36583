FactoryBot.define do
  factory :item do
    item_name           {'フリマ'}
    content             {'フリマアプリ'}
    category_id         {3}
    condition_id        {3}
    shipping_charge_id  {2}
    area_id             {2}
    shipping_date_id    {3}
    price             {3000}
    association :user
      
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
