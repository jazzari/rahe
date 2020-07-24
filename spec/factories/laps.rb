FactoryBot.define do 
	factory :lap do 
		sequence(:time, 2000) { |n| "#{n}" }
		setting { "false" }
		hardware { "false" }
	    sequence(:notes) { |n| "This is note number: #{n}" }
	    association :user
	    association :simulator
	    association :track
	    association :car
	end
end