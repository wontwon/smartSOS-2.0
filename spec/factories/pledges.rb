FactoryGirl.define do
  factory :pledge do
    association :request
    association :donor
    quantity { rand(10) }
  end
end
