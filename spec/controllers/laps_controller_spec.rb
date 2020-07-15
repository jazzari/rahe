require 'rails_helper'

RSpec.describe LapsController, tyoe: :controller do 

	login_user
	let(:user) { create :user }
	let(:lap) { create :lap }
	#let(:valid_session) { {} }

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

	describe 'POST #create' do 
	  
		it "should create a new lap" do 
			post :create, :params => { :lap => { id: 1, time: 1005, 
				setting: "false", hardware: false } }

			expect(Lap.count).to eq(1)
			expect(Lap.first[:time]).to eq(1005)
		end
	end

end