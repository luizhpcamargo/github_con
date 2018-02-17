Rails.application.routes.draw do
  root to: 'dashboard#index'
  post 'dashboard/fetch_data', to: 'dashboard#fetch_data', as: :fetch_data
end
