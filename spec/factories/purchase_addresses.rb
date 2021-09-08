FactoryBot.define do
  factory :purchase_address do
    postal_code      { '123-4567' }
    area_id          { 2 }
    municipality     { '石川県' }
    street_number    { '1-1' }
    building_name    { '石川' }
    telephone_number { '08012345678' }
    token            {"tok_abcdefghijk00000000000000000"}
   
  end
end
