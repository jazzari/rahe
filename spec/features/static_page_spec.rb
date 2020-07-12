require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe 'navigate to root' do 
		subject { get :index }

		it "should route to index" do 
			expect(subject).to render_template('index')
		end

	end 

end