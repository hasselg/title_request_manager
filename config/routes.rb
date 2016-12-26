Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :title_requests
  match '/reporting/open', to: 'title_requests#generate_open_report', via: [:get, :post]
  post '/reporting/remittance', to: 'title_requests#generate_remittance_report'
  get '/reporting/', to: 'title_requests#generate_report'
  get '/ajax', to: 'title_requests#ajaxindex'
  root 'title_requests#index'

end
