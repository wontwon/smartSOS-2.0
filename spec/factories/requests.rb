FactoryGirl.define do
  factory :request do
    association :campaign
    association :item
    quantity { rand(10) }
  end
end
