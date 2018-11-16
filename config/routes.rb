Rails.application.routes.draw do
  get 'landing_pages/startup', to: 'landing_pages#startup'
  get 'landing_pages/lyon', to: 'landing_pages#lyon'
  root 'landing_pages#basic'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
