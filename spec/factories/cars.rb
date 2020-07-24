FactoryBot.define do 
	factory :car do 
		name { "Car1" }

	    association :track
	end
end