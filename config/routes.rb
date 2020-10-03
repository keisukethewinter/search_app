Rails.application.routes.draw do
  root 'production#index'
  get 'production/search'
end
