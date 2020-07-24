FactoryBot.define do 
	factory :track do 
		name { "Track1" }

	    association :simulator
	end
end