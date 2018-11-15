Rails.application.routes.draw do
  get '/camion', to: 'camion#view'
  get '/congratulation', to: 'camion#congratulation'
  post '/camion', to:'camion#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Facebook::Messenger::Server, at: 'bot'
  get '/bot', to: 'home#index'
end
