Rails.application.routes.draw do
  get 'products/index'
  get 'products/search'
  root 'production#index'
  get 'production/search'
end
