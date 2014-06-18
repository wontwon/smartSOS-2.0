# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name { Faker::Name.last_name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { '10000' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation 'password'
    phone { '1234567890' }
    description { Faker::Lorem.paragraph }
    url { Faker::Internet.url }

    factory :invalid_organization do
      name nil
    end
  end
end
