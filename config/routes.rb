Rails.application.routes.draw do
  root to: 'dashboard#index'
  get 'dashboard/fetch_data', to: 'dashboard#fetch_data', as: :fetch_data
end
