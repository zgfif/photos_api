require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "GET /index" do
    it "returns http unauthorized" do
      get '/images'
      expect(response).to have_http_status(401)
    end

    it 'returns http ok' do
      headers = { "Authorization" => "Bearer 2cf47964c753085204cd7b590731ab8377045c1d" }
      get '/images', headers: headers
      expect(response).to have_http_status(:ok)
    end
  end
end
