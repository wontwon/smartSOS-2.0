FactoryGirl.define do
  factory :pledge do
    association :request
    association :donor
    quantity { rand(1..10) }
  end
end
