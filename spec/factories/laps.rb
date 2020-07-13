FactoryBot.define do 
	factory :lap do 
		sequence(:time, 1000) { |n| "#{n}" }
		setting { "false" }
		hardware { "false" }
	    sequence(:notes) { |n| "This is note number: #{n}" }
	end
end