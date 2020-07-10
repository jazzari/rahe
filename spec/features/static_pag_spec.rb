require 'rails_helper'

describe 'navigate to root' do 

	it "should route to index" do 
		expect(get '/').to route_to('home#index')
	end

end 