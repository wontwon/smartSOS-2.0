# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    association :request
    association :donor
    quantity { rand(10) }
  end
end
