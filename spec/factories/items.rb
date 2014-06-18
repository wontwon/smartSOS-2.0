# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    asin { (0...10).map { (65 + rand(26)).chr }.join }
    name { 'Dog Food' }
    img_url { Faker::Internet.url }
    price { rand(9999) }
  end
end
