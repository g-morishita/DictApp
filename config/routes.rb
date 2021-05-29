Rails.application.routes.draw do
  resources :items do
    resources :texts
  end
  root 'items#index'
  get '/items/:item_id/texts/:text_id/check', to: 'texts#check', as: :check
end
