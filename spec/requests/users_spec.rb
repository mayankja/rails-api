require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it "works! (now write some real specs)" do
      headers = {
        "token" => "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9"
      }
      get users_path, { :widget => {:name => "My Widget"} }, headers
      expect(response).to have_http_status(200)
    end
  end
end
