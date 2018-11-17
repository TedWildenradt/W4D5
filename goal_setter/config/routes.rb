Rails.application.routes.draw do
  # get 'session/new'
  # get 'session/create'
  # get 'session/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :show] do 
    resources :goals,only:[:create,:new]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals,except:[:new,:create]
end
