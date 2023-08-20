Rails.application.routes.draw do
  resources :cars do 
    resources :parts
  end
end
