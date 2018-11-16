require 'rails_helper'

Rspec.describe UsersController, type: :controller do
  
  describe 'GET #new' do 
    it 'renders the new template' do 
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do 
    context 'with valid params' do
      it 'is able to login' do 
        post :create, params: {user: {email: 'email@gmail.com',password: 'password'}}
        user = User.find_by_credentials('email@gmail.com', 'password')
        expect(session[:session_token]).to eq(user.session_token)
      end
      it 'is redirected to the user\s page' do 
        post :create, params: {user: {email: 'email@gmail.com',password: 'password'}}
        user = User.find_by_credentials('email@gmail.com', 'password')
        expect(response).to redirect_to(user_url(user))
      end
    end
    # context
  end
  
  
end