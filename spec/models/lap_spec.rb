require 'rails_helper'

RSpec.describe Lap, type: :model do

  describe '#validations' do 
    let(:user) do
        create :user
    end

  	it "should test that the factory is valid" do 
  		expect(build :lap).to be_valid
  	end

    it "can't be created without a user" do 
      lap = build :lap, user_id: ''
      expect(lap).not_to be_valid
    end

  	it "should validate that time is greater than 999 miliseconds" do 
  		lap = build :lap, time: 800
  		expect(lap).not_to be_valid
  		expect(lap.errors.messages[:time]).to include("must be greater than 999")
  	end

  	it "should validate that time is less than 3600000 miliseconds" do 
  		lap = build :lap, time: 4000000
  		expect(lap).not_to be_valid
  		expect(lap.errors.messages[:time]).to include("must be less than 3600000")
  	end

  	it "should validate setting to be true or false" do 
  		lap = build :lap, setting: nil
  		expect(lap).not_to be_valid
  		expect(lap.errors.messages[:setting]).to include("is not included in the list")
  	end

  	 it "should validate hardware to be true or false" do 
  		lap = build :lap, hardware: nil
  		expect(lap).not_to be_valid
  		expect(lap.errors.messages[:hardware]).to include("is not included in the list")
  	end

  	it "should validate length of notes" do 
  		lap = build :lap, notes: "a" * 282
  		expect(lap).not_to be_valid
  	end

  end


end
