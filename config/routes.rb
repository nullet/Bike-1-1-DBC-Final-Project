Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users,
    :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'},
    :controllers => {registrations: 'registrations'}

  resources :events
  resources :users
  get '/dashboard' => 'dashboard#index'
  get '/karma' => 'dashboard#karma', as: 'karma'
  post '/phones/login' => 'phones#login'

  # Mobile App
  resources :phones
end
