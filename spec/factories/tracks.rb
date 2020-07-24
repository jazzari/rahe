FactoryBot.define do 
	factory :track do 
		sequence(:name) { |n| "Track N #{n}" }

	    association :simulator
	end
end