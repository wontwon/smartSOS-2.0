require 'faker'

FactoryGirl.define do 
	factory :donor do 
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { "password" }
		password_confirmation { "password" }

		factory :invalid_donor do 
			first_name { nil }
		end
	end
end