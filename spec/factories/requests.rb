FactoryGirl.define do
  factory :request do
    association :campaign
    association :item
    quantity { rand(1..10) }
  end
end
