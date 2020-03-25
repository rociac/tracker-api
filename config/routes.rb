Rails.application.routes.draw do
  resources :measures do
    resources :values
  end
end
