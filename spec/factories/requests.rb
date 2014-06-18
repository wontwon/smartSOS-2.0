# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    association :campaign
    association :item
    quantity { rand(10) }
  end
end
