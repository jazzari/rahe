
require 'rails_helper'


RSpec.describe HomeController do


  before { sign_in }

  describe 'GET #index' do

    it "should return status ok" do
		get :index
      expect(response.status).to be(200)
    end

  end 

end