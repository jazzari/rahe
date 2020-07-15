require 'rails_helper'

RSpec.describe LapsController, tyoe: :controller do 

	login_user
	let(:user) { create :user }
	#let(:valid_session) { {} }

	describe "GET #index" do 
		subject { get :index }

		it "should returns a success response" do 
			build :lap 
			expect(response).to be_successful
		end
	end

	describe 'GET #show' do 
		let(:lap) { create :lap }
		subject { get :show, params: { id: lap.id } }

		it "should returns a success response" do
			subject 
			expect(response).to be_successful
		end
	end

end