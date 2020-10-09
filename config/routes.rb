Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  root to: 'welcome#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
