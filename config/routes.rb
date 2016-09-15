Rails.application.routes.draw do
  resources :abstracts
  resources :title_requests
  get '/ajax', to: 'title_requests#ajaxindex'
end
