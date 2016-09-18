Rails.application.routes.draw do
  resources :title_requests
  get '/reporting/open', to: 'title_requests#generate_open_report'
  get '/ajax', to: 'title_requests#ajaxindex'
  root 'title_requests#index'
  
end
