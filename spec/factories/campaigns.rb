# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    association :organization
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    end_date { '02-10-2014' }

    factory :invalid_campaign do
      name nil
    end
  end
end
