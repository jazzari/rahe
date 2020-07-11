require 'rails_helper'

describe 'navigate to root' do 
	

	it "should route to index" do 
		visit root_path
    	expect(page.status_code).to eq(200)
	end

end 