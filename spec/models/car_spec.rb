require 'rails_helper'

RSpec.describe Car, type: :model do
	describe '#Validations' do 

		it "should have valid factory" do 
			expect(build :car).to be_valid
		end

		it "can't be created without a track" do 
      		car = build :car, track_id: ''
      		expect(car).not_to be_valid
    	end

    	it "should validate presence of name" do 
    		car = build :car, name: ''
      		expect(car).not_to be_valid	
    	end

	end
end
