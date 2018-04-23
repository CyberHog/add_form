Rails.application.routes.draw do
  root "users#index"
  get "users/edit"
  get "users/show"
  get "users/new"

  resources :users do
  	resources :clinics
  	resources :patients
  end
  resources :clinics do
  	resources :clinic_cards
  	resources :menus
  end
  resources :patients do
  	resources :clinic_cards
  end
  resources :clinic_cards do
  	resources :patients_receipts
  end
  resources :patients_receipts do
  	resources :receipts
    resources :menus
  end
  resources :receipts do
  	resources :menus
  end
  resources :menus
end
