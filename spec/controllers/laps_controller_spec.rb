require 'rails_helper'

RSpec.describe LapsController, tyoe: :controller do 

	login_user
	let(:user) { create :user }
	let(:simulator) { create :simulator }
	let(:track) { create :track }
	let(:car) { create :car }
	let(:lap) { create :lap }


	describe "GET #index" do 
		subject { get :index }

		it "should returns a success response" do 
			expect(response).to be_successful
		end
	end

	describe 'GET #show' do 
		subject { get :show, params: { id: lap.id } }

		it "should returns a success response" do
			subject 
			expect(response).to be_successful
		end
	end

	describe 'GET #edit' do 
		subject { get :edit, params: { id: lap.id } }

		it "should exist lap and returns a success response" do 
			subject
			expect(response).to be_successful
		end

	end

	describe 'GET #new' do 
		subject { get :new}

		it "should exist lap" do 
			subject
			expect(response).to be_successful
		end

	end

	describe 'POST #create' do 
	  
		it "should create a new lap and save it to the DB" do 
			post :create, :params => { :lap => { id: 100, time: 5005, 
				setting: false, hardware: false, notes: "some notes", 
				user_id: 1, simulator_id: 1, track_id: 1, car_id: 1 } }

			expect(Lap.count).to eq(1)
			expect(Lap.first[:hardware]).to eq(false)
		end
	end

	describe 'PATCH #update' do 
	  
		it "should modife an existing lap and save it to the DB" do 
			patch :update, :params => { id: lap.id, :lap => { time: 2005, 
				setting: "true", hardware: false } }

			expect(Lap.count).to eq(1)
			expect(Lap.first[:setting]).to eq(true)
		end
	end

	describe 'DELETE #destroy' do 

		it "should destroy the actual lap" do 
			delete :destroy, params: { id: lap.id }
		end

	end

end