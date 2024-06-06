FactoryBot.define do
  factory :order_form do
    postal_code      { '123-4567'}
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }  
    city             { '横浜市緑区' }
    address_line1    { '1-1' }
    address_line2    { '青山ビル' }
    phone_number     { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
 