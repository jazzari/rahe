require 'rails_helper'

RSpec.describe LapsController, tyoe: :controller do 
	#let(:valid_attributes) {
	#	{ time: 1001, setting: false, hardware: false, notes: "some notes" }
	#}

	login_user

	let(:valid_session) { {} }

	describe "GET #index" do 
		it "returns a success response" do 
			build :lap 
			get :index, params: {}, session: valid_session
			expect(response).to be_successful
		end
	end

end