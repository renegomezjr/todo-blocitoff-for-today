require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET show" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create!(name: "User name", email: "email@email.com", password: "password")
      sign_in user
    end

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
