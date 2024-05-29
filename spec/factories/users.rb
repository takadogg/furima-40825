FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name            {'信長'}
    last_name             {'織田'}
    first_name_kana       {'ノブナガ'} 
    last_name_kana        {'オダ'}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
