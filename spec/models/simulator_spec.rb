require 'rails_helper'

RSpec.describe Simulator, type: :model do

	describe '#Validations' do 

		it "should have valid factory" do 
			expect(build :simulator).to be_valid
		end

		it "can't be created without a user" do 
      		simulator = build :simulator, user_id: ''
      		expect(simulator).not_to be_valid
    	end

    	it "should validate presence of name" do 
    		simulator = build :simulator, name: ''
      		expect(simulator).not_to be_valid	
    	end

	end

end
