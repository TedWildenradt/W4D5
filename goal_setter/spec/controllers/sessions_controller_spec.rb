require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders login page" do
      get :new
      expect(response).to render_template(:new)
    end
    
  end

  describe "POST #create" do
    it "logs in user" do
      post :create, params: {user: {email: 'ted@email.com',password: 'password'}}
      debugger
      user = User.find_by_credentials('ted@email.com', 'password')
      expect(session[:session_token]).to eq(user.session_token)
      expect(response).to redirect_to(user_url(user))
      expect(response).to have_http_status(:success)
    end
    it "renders the user's page" do
      
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
