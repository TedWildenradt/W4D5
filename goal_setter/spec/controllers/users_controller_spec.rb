require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
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
        expect(response).to redirect_to(user_url(user))
      end
    end
    context 'with invalid params' do
      it 'shows errors' do
        post :create, params: {user: {email: 'email@gmail.com', password: ''}}
        expect(flash[:errors]).to be_present
        expect(response).to render_template(:new)
      end    
    end
  end
  
  
end