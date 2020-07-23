FactoryBot.define do 
	factory :simulator do 
		sequence(:name) { |n| "simulator N #{n}" }
	    association :user
	end
end