Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users
  resources :measure_dates do
    resource :measures
    resource :values
  end
end
